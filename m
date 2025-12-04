Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11976D1F9AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EBpXU61ZQEoOTX+cW7yeiSElN/Bto8IzYh+gLF9OA8=; b=ckK0xu72Vcx6G0T7znEqM/oMUf
	2Q5FrjuXlHIuKhXLt9KMm0F19wg1PNGj15Gu90gaqbsZoaJKvDwoOjPR/ghPX3xNl4Dlthwqh/LBT
	Ind5rhfWGhKpf2HxXYpyj8TsdU1e4vxf03mJqQXVsURjPmkssC86+Dg2fqsNZU8xur44KSpEQrAY7
	yb2XeX5G1kdz9SMcoaIDJbGJROl5Fvf16Mlh3owYKXvZFV9X2n++gCapp6lRbZnODSOhTV3a//zyY
	pXoadBoQ9K8pOL2wUD/5pQrq9eXvGZBTJH7dNABIfcwhK09r8aiq6C2rbm1tKAmUgcPsEvAkicvsE
	89NpuEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6cw-00000007qJo-1wjx;
	Thu, 04 Dec 2025 10:31:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6ct-00000007qJL-3a17
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:31:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EBA0339;
	Thu,  4 Dec 2025 02:31:46 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FE6C3F73B;
	Thu,  4 Dec 2025 02:31:53 -0800 (PST)
Date: Thu, 4 Dec 2025 10:31:51 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251204103151.GK724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_023155_952027_F048356D 
X-CRM114-Status: GOOD (  15.37  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 04, 2025 at 09:07:56AM +0000, Mike Leach wrote:

[...]

> > I saw CTI registers are within 4KiB (0x1000), we can don't convert
> > standard regiserts and only convert to QCOM register based on the
> > standard ones.  So you can drop the cti_normal_offset strucuture and
> > only have a cti_reg_qcom_offset[] struct:
> >
> >   static const u32 cti_extended_offset[] = {
> >         [CTIINTACK]             = QCOM_CTIINTACK,
> >         [CTIAPPSET]             = QCOM_CTIAPPSET,
> >         [CTIAPPCLEAR]           = QCOM_CTIAPPCLEAR,
> >         [CTIAPPPULSE]           = QCOM_CTIAPPPULSE,
> >         [CTIINEN]               = QCOM_CTIINEN,
> >         ...
> >   };
> >
> 
> I suggested the dual offset approach a couple of patchset revisions
> ago as it actually simplifies the code & makes it more efficient. The
> offset array in use is set during probe and the remaining code is then
> common to both without lots of "if qcom else " occurences.

AFAICS, we will handle the QCOM CTI particularly in three cases:

  1) The register access;
  2) The claim tag;
  3) Sysfs attr is visible.

Now we are discussing the reigster access.  As suggested, the
"if qcom / else" is encapsulated (e.g., in cti_reg_addr_with_nr()), it
will not spread out.

I'd use standard registers by default and convert to non-standard ones
only when needed.  A new "neutral" index layer seems redundant, as the
existing standard register indexes already serve this purpose.

For the sysfs attrs, it makes sense to use a central place to decide
which knobs are only visible for QCOM CTI, otherwise, we also will not
spread the condition check.

I will reply separately for claim tag issue.

Thanks,
Leo

