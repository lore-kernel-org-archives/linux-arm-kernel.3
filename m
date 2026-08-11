Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F83BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmcD5/Pkj3PY0x8OJ6vSMi1otWncIykWwVp2UYuWZpY=; b=GZFMIeT1kKDYGd0SrsCEAtojMU
	Bm8iGQzcWqhOXKlyuBUNpZLHabH/XmCbOBNex4GKT3S2C75+smlveUVduyG9lmYhWmp9OT0yqfmTB
	fUmZWSY4uLbRI4BfPq9TYEG87NCP092KBoaLwBCPi6RadVgwFcxABoVqJg2UCfybIZWQfMbOe4PD3
	CDLOmxEoQXMIlmNB94JKwb3rbeXpW6sm4eNFHYMr01aHvechQbJLbB/GuCZZiB8+HcgMAjb9BAoGH
	9Fg1B4Mm+EYosncRoKDRbiBc4aJrYoz/1ggcG96z9KkZoaAS2fsTcSAbqcX+LupJDJx+nY0GRQf1C
	BHt5fd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpxz-0000000EbXn-22ML;
	Tue, 11 Aug 2026 17:08:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpxx-0000000EbXO-114C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:08:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98BF91516;
	Tue, 11 Aug 2026 10:08:35 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01B263F632;
	Tue, 11 Aug 2026 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786468119; bh=l1B9kwgyagD4GTWYA9xgnxv0nriU8NaPIVqR0Qd5zmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APAiW2Zlva9nQ4ZC+uRn2ZfzKnWWX0iCF8tncuonwqcDnIyyivoLkZHLVpNsyPbeI
	 MnWddE2aIZrpKXOMDzPCBLGSKTChYL1mOBUhDJqsO1v9TZP0On8QqEi8f0Ym/tDxdJ
	 SxbiiWnpra/o+iazXauyss32FCHPXfdN5hfKmA1g=
Date: Tue, 11 Aug 2026 18:08:35 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 10/13] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <antXE3aHdY21KTj6@e129823.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-11-yeoreum.yun@arm.com>
 <20260811170242.GH15499@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811170242.GH15499@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_100841_328010_C3274A17 
X-CRM114-Status: GOOD (  16.66  )
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

On Tue, Aug 11, 2026 at 06:02:42PM +0100, Leo Yan wrote:
> On Sat, Jul 25, 2026 at 12:36:42PM +0100, Yeoreum Yun wrote:
> > The purpose of TRCSSCSRn register is to show status of
> > the corresponding Single-shot Comparator Control and input supports.
> 
> I vaguely remember that we discussed the issue with always clearing
> drvdata::ss_status in hw_enable(), which might result in single-shot
> does not work properly in a perf session.
> 
> This issue is not introduced by this patch, and I think we agreed to
> address it later. Could you document it in the commit log so that we
> can understand and track the issue later.

Okay. I'll add this in commit message.

> 
> > That means writable field's purpose for reset or restore from idle status
> > not for configuration.
> > 
> > Therefore, exclude ss_status from drvdata->config and move it to drvdata.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> With above amending:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Thanks!

-- 
Sincerely,
Yeoreum Yun

