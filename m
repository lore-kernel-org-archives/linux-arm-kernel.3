Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D052AD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQmpsyV7MwYPwrR4/jVrvmxUvMdM80/ekJyUWAZ5Vvk=; b=Ye2SfAOS064UZcPH/1zja/Dfmn
	wt45VBjiwfcUAJO12Bhx49ROH+smDYZhYl/6Zuica7v2ki+tGfJ69fMvgvVvKvBqR2FnfZ668S9WK
	crMTs5HDCWAFiHSPxB94hMmw+1uIACCjq/4/vz/y+kUXIKpk+gvU3aHqSPkuqXaNbHKvbDg4Rv4EO
	wkL317KefgwnkB0Ip5Ejrl/wr/90PYydR2bt8eSUhRXJMWyLlZTpDQypFJ5bWElqKd/0xikS9GEjV
	+tA+VcMSe0WSOCPlZ2xfK4dVdYn+iNTN56H6gB/jORBIg+YEGai/0QjMiK5fGMY8VpEtBZje+A1k9
	LTAqJz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyFG-0000000EMRx-3Apd;
	Tue, 09 Dec 2025 13:59:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyFD-0000000EMRJ-3RIa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:59:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0DF2175D;
	Tue,  9 Dec 2025 05:59:02 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B1623F740;
	Tue,  9 Dec 2025 05:59:09 -0800 (PST)
Date: Tue, 9 Dec 2025 13:59:07 +0000
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
Message-ID: <20251209135907.GU724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
 <20251204103151.GK724103@e132581.arm.com>
 <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>
 <20251205100432.GO724103@e132581.arm.com>
 <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_055911_892844_69831AD0 
X-CRM114-Status: GOOD (  18.92  )
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

Hi Mike,

On Mon, Dec 08, 2025 at 02:47:21PM +0000, Mike Leach wrote:

[...]

> > I tested locally and did not see the GCC complaint for this approach.
> > And this is a global structure with about 16KiB (~4K items x
> 
> Which is precisely the issue - why use 16k bytes of space when a pair
> of indexed tables will use 21 x 32bit locations per table -> 168 bytes
> - 100x smaller!
> 
> This space matters little to high end server systems but is much more
> important in smaller embedded systems.

For the concern of performance and footprint, my approach can
avoid any conversion for standard registers, we end up need to
convert registers for non-standard registers anyway.

I understand your concern for using an array for conversion, this is
cost 16KiB memory but this can benefit a bit performance.  It is a
trade-off between memory and speed.  As said, we can use a static
function for register conversion, the side effect is this might cause
more time.

Given the CTI MMIO register access, I don't think an extra branch
instruction (checking the flag) would cause significant panelty,
given the flag is set once at init and never changed afterwards.

> Moreover the table + inline helper is more efficient at extracting the
> correct offset value. The helper is a simple de-reference - whereas
> the helper functions you suggest require the code to make the
> comparison at every register access.
> The "if qcom ..." may be contained in one place in the source code,
> but is called and executed for every access.
> 
> Why add inefficiencies, either in footprint or execution?

This is about how we design a driver that supports both a standard IP
and non-standard implementations.

Because the standard IP is well defined, its register layout should be
the default; it keeps the code simple and makes future CTI extensions
easier.  For non-standard IPs, we only apply the register translations
needed.

TBH, the optimization topic is a bit over design for me now.  The CTI
module is configured once and remains untouched until it is disabled,
so it is not a hot path.

Thanks,
Leo

