Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A704FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szuDD/3h4LKVK+iQXuffkBdE1gCpSlGTfwZb0zE9lw0=; b=tQw5EtcGpPT9XRNrZFUQm97Wai
	ZtjrIenD3lRD2e2kgtwQHkKOVLf8Fbo4RIiu7xAK3Ct3nRE9XD8WBEpweod9qCPK49knRgCOII/gp
	Wr1eP3RWffklGZJzwN+4iMRI6KOgY4DqAeRZ0UREYRh1fxstYkVGAFYjAnivCeHmIJmM4VTD5N4DR
	9ERxVhQSN+Wx/qz3q+z5MvEmCSRGyt/Snd+hEKrzuVLfwAZguqWlhh7D+KuLXKwndBhLysjlSyBhx
	EIWqxy1HVRHfOmHG+JY4Cx7HkA0O1fkXTzbXSXzSNYQopqiX/N4bK6DQvz/cs/VE+7vCE3J1fB66M
	5QOGx1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCas-0000000AKxn-1zAt;
	Mon, 16 Dec 2024 15:01:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCZ1-0000000AKZj-3kWe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:59:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA51EA4150D;
	Mon, 16 Dec 2024 14:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194C5C4CED0;
	Mon, 16 Dec 2024 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734361154;
	bh=CnvCaWfgDwIgWkQpCmUclLH+JSJGlMt1flV6kcuDogg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpUw+ffutRGge33RcZNfYtcrP4tvXIGpc2EocSBMRUa3L0AKfWgSvhR4xUJuAjG2L
	 JYuVLSdn4gSFYNJ+hVPasm9euCexo1DmxJet8DCJEn7/FboftWcrwgogu5WsUBwmP7
	 UmG3dh8jisxi6QzFn/u9yS8pYU6MAVpw0wpeNW615w175U8G3dQYEgztV8KASfe1QH
	 aM5eDBV7FtIOk5Nq8zZv50Ye+NJAvVaJ5l0y2UjbCmFjwAuYqu04x9Ay8J41ZKE1/A
	 fye1EBBDzjFEVlXLnuAUc5MQ4mADgp4Ug7mr8K+I0UjoLsviGbBY630gMhoaLeG2+/
	 zKZ448pI4jznQ==
Date: Mon, 16 Dec 2024 09:59:12 -0500
From: Sasha Levin <sashal@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] arm64 fixes for 6.13-rc3
Message-ID: <Z2BAQEuXJg01qWDp@lappy>
References: <Z1xx0ha7lbKkdhRC@arm.com>
 <Z18MixiGByAqDYLC@lappy>
 <Z1_6ukG_Lc5leG1o@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z1_6ukG_Lc5leG1o@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_065915_991427_CF0C93A7 
X-CRM114-Status: GOOD (  11.65  )
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

On Mon, Dec 16, 2024 at 10:02:34AM +0000, Mark Rutland wrote:
>On Sun, Dec 15, 2024 at 12:06:19PM -0500, Sasha Levin wrote:
>> On Fri, Dec 13, 2024 at 05:41:38PM +0000, Catalin Marinas wrote:
>> > - arm64 stacktrace: address some fallout from the recent changes to
>> >  unwinding across exception boundaries
>>
>> Hi Catalin, Mark,
>>
>> It seems that kselftests can hit a warning that was addressed in the
>> commit above:
>
>I assume you're referring to commit:
>
>  32ed1205682ec42a ("arm64: stacktrace: Skip reporting LR at exception boundaries")
>
>... ?

I was actually thinking 65ac33bed8b9 ("arm64: stacktrace: Don't WARN
when unwinding other tasks"), sorry for the confusion

>That was intended to fix this specific issue, as explained in the commit
>message (with a very similar splat from running the ftrace kselftests).
>
>Am I missing something? i.e. are you saying it *doesn't* fix that?

Right - LKFT is able to trigger the warning I copied on Linus's tree.

-- 
Thanks,
Sasha

