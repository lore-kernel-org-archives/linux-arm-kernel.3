Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB36ED3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IxKM1bvrKUnlc1b7AKBwGdCXDI68wGOeUdMiGJPGnI=; b=GiM1p+mrF/4n2jlqdQ01IKgzSp
	nEORXEmlRR3szZnXX38Zljkwxf9ghTpiLkQAgQorj95tm7rHw/MmXgL9UxSSdff46DCERbKNwVxa6
	htVxpbflw7AUjfzwQ2TDN5Vqo2/VHM2rhN5x/N6T0PVjOC6ATEBqVr24iecapPjHIxeJYqBEUnvFC
	3SsnS6YGKJRtx8ZbzQ1FFc2zoXtiztv9CtI18yVBPLlIjTAYYjpuNpA3ZMnc31NAsQ+GPgBwywI4g
	J0JWpw7P4tVTqPzXTJbdbkQH9jdL8qvXKhWm00fAVhQ5U5O3f9g83Y73HJFYyIW8F4WjeGQ3QnwKf
	zLFyZbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSydw-0000000EOxb-3wa3;
	Tue, 09 Dec 2025 14:24:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSydu-0000000EOxF-1tDR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 14:24:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87635175D;
	Tue,  9 Dec 2025 06:24:33 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 635FA3F740;
	Tue,  9 Dec 2025 06:24:40 -0800 (PST)
Date: Tue, 9 Dec 2025 14:24:38 +0000
From: Leo Yan <leo.yan@arm.com>
To: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
Cc: mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org, james.clark@linaro.org,
	jinlong.mao@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_jinlmao@quicinc.com, suzuki.poulose@arm.com,
	tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251209142438.GV724103@e132581.arm.com>
References: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
 <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
 <20251209121916.GT724103@e132581.arm.com>
 <1fbe140c-b960-4f13-83e2-b0a0733a67bc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fbe140c-b960-4f13-83e2-b0a0733a67bc@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_062442_557722_D9A64933 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 09, 2025 at 08:51:38PM +0800, Yingchao Deng (Consultant) wrote:

[...]

> >    void cti_write_single_reg(struct cti_drvdata *drvdata,
> >                              int offset, u32 value)
> >    {
> >            CS_UNLOCK(drvdata->base);
> >            writel_relaxed(value, cti_reg_addr(drvdata, offset));
> >            CS_LOCK(drvdata->base);
> >    }
> 
> However, since we also need to handle cti_reg_addr_with_nr, it will be
> necessary to add an additional parameter "nr" to cti_write_single_reg?

I expect the argument "offset" has already containted the nr in
bits[31..28], so don't need to pass "nr" parameter to
cti_write_single_reg().

You will change inen_store() / outen_store(), e.g.,:

    cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIINEN, index),
                         value);

Just remind, this might be a separate refactor for common code and you
need to write a patch for this, then is followed by QCOM CTI support
patch.

Thanks,
Leo

