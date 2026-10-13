Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E86CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNtuwMYgoAZNOiN046PW81pb6VOFTVwCOc3cDIrjOrM=; b=oBLbpGkyXqob3tEGoVAfQwGnd9
	9mebyEq3fDwsFGX9QSDMfS7bM+jBpVgfKMVm9srHskHJwOfXAHg+J9N4qS4RGrycjzchSuJXzF8uF
	uinB8qQdY53R8bqRHJJ7QmTnTCKEnbhoCTBTsXW9SsrbuaiNCW23Zse7VDgIHNO1zTypsKGcHbCCX
	0cJSm+7AWwUM/v2a255dE8m4G7ui6ZZ85oxMEswgwpn2SDj4X8B+C+3cU7IRDo7UzwZfpUdz/+vP9
	PtNDiNMaSfjTOUSnMbeOYD6KO1qezAXBz1TDhRHDUK1UR+00UqB3zEhfTh20vo4VYqB8GkNvs8W3v
	1bRiYKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcyI-0000000D1BH-41Vq;
	Tue, 13 Oct 2026 13:55:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcyH-0000000D1B7-33E6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:55:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C3AB40F8B;
	Tue, 13 Oct 2026 13:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94041F000FF;
	Tue, 13 Oct 2026 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791899713;
	bh=LNtuwMYgoAZNOiN046PW81pb6VOFTVwCOc3cDIrjOrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WZC50zoAAIKnU/0RbrU9leHZXlSbLHhVVHFTkKGyl7A4Wze2NWvg9NJnHhk/KDq6W
	 F75XN3sQCrx7rYAPVM5rGLIYf+4fofeXAd498JmbUWYvT8Oc7khzij5BOH0v6jh1u1
	 cDz38XiiqBAglL625+NjNRSHPdOSLb6u2lRci8r0=
Date: Tue, 13 Oct 2026 15:53:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org, leo.yan@linux.dev, mike.leach@arm.com
Subject: Re: [GIT PULL] coresight: Update for linux v7.4
Message-ID: <2026101332-relish-angled-28e5@gregkh>
References: <20261012101831.2624135-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012101831.2624135-1-suzuki.poulose@arm.com>
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

On Mon, Oct 12, 2026 at 11:18:31AM +0100, Suzuki K Poulose wrote:
> Hi Greg
> 
> Please find the updates for coresight self hosted tracing subsystem targeting
> Linux v7.4. Apologies for the delay!
> 
> Kindly pull.
> 
> Suzuki
> 
> 
> The following changes since commit df2908090cda368b01ff43709f51890076c56157:
> 
>   Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.4
> 

Pulled and pushed out, thanks.

greg k-h

