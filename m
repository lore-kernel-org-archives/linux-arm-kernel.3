Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB7CCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 04:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9D7MMPkSZhjVq6hlRBDYzlOjp+CnuCQUDvEFL+xDQDI=; b=vLcuetX1MuTczbm75ZwcXmRHDY
	85XYfiliRkfvcCpWCyydvxPMhXsUo+nis232nep0bjLWx+yhrAqUbvY6J7++LY2E0gUsdCeZza+MN
	B3BoQuAluZEa4XW2fWKTdXfD1RjgfuEGrSf2CrZRUxlOEwrJxJMtLEe+73gy5GpwJ10DcbLJhE2Y1
	z5ctSRJxLkHIuPGadLUbzp4wW6WWVnFDFfQ4rG7sb/fExh+8FtwrXUGLvsvDfEeT/GlbxEzC0d/op
	rhFybl4SVUXjOyz7X6tuGvipKFX363kQWdx7tBCIKRhlPHaWjiHUV+rvpxFbDmRmwbgjLAQWTT/lT
	G1rc9SGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgty-00000005O44-1t4q;
	Fri, 31 Oct 2025 04:38:14 +0000
Received: from mail-m32110.qiye.163.com ([220.197.32.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgtu-00000005O3X-2ZG1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 04:38:12 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27deeccb5;
	Fri, 31 Oct 2025 12:38:04 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzysztof.kozlowski@linaro.org
Cc: arnd@arndb.de,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	will@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH v5 0/6] arm64: introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board
Date: Fri, 31 Oct 2025 12:38:03 +0800
Message-ID: <20251031043803.781326-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ad1bb032-6d58-435b-b2bc-04aa26d41d58@linaro.org>
References: <ad1bb032-6d58-435b-b2bc-04aa26d41d58@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a388ef3c409cckunm404592c761173f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTx8dVhhKTktMGEhOQkkeSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PzPRPL2310JdW9Re2Ybec0cHbMyoSiSGnUFWbjShL8juQ+2rLnAysUg4vxiKlzYnnPFSIU1Cf3pMuQtwf89uvvnrQwjXuMo5UdYlbANEA72XI6xtF+GGTZoJg2fQ3E3kDLfc/PaFc5yeYASHK87cauI0n5KzVETc1gzQ7CqLZ6o=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=9D7MMPkSZhjVq6hlRBDYzlOjp+CnuCQUDvEFL+xDQDI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_213811_119166_3B104EB7 
X-CRM114-Status: GOOD (  16.09  )
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

On Thu, Oct 30, 2025 at 04:04:39PM +0100, Krzysztof Kozlowski wrote:
> On 30/10/2025 12:40, Albert Yang wrote:
> > Hi Krzysztof,
> >
> > Gentle ping on this series. It's been two weeks since v5 was posted.
> >
> > This version addresses the DTS coding style and property ordering issues
> > from our previous discussion [1]. Following Arnd's suggestion [2], the MMC
> > patches have been removed and will be submitted separately.
> >
> > Patch 2/6 (arm bindings) already has your Reviewed-by. The remaining
> > patches (Kconfig, DTS, defconfig, and MAINTAINERS) are ready for review
> > when you have time.
>
> I don't understand this ping. You received the reviewed from me or other
> maintainers, where we were responsible to give such review. Probably you
> assume that my job is to review something else here, but sorry, that's
> not my job at the time of this patchset was prepared (we don't count
> here recent changes because that would mean you ping me after few days...).
>

My apologies for the confusion. You're absolutely right about the
maintainer responsibilities.

I should clarify why I pinged you: You provided valuable feedback on
earlier versions of this series, including the DTS patches. Since those
changes were made based on your input but hadn't received confirmation,
I wanted to make sure they properly addressed your concerns. However, I
now understand that the SoC-specific patches (Kconfig, DTS, defconfig,
MAINTAINERS) should be reviewed by the ARM SoC maintainers.

Thank you for your reviews and for clarifying the proper process. I'll
follow up with Arnd for the remaining patches.

Best regards,
Albert

