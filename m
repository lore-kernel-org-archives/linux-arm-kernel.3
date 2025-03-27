Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D6EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 21:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdv9JRegSNswIU8NCARaciRk1V+G0Rq8cpGTpJkqjUo=; b=HawSU/dMtxRFs1tyfNu/qrbOo3
	7ZOvnyrelK/0KdIm8zZMDtmcJeFb7jjBgJaHs04GP61eIsC7TZiGD5dWL8oYpZ5KgJZX2nkK6Uskd
	s3ZRVzrCKoOkL0ikniERg05Y8GHYhk2hdhjv3+peCT6mSiT3ykVAtqPgoRsx+lsBlgABOZfu6Hpn3
	PZMkZTwmCLgO1gX7ZT5ZZr7CX0Wvifd78WUkpxL3oPCSBp60tFnREVryZfkeDysRdYzqgKEPLzDIw
	D/qh4Py3ym0ePIZBXBPQRjAhf7cL3HT61cXmaOIaJRFOKV7cj+aR/wf7UfKrciRA+MoAJdd7hgCrC
	uinYk0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txvGF-0000000C6iM-2WAz;
	Thu, 27 Mar 2025 21:59:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txvEV-0000000C6Rj-1ZpO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 21:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D004AA42F20;
	Thu, 27 Mar 2025 21:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3B8C4CEDD;
	Thu, 27 Mar 2025 21:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743112669;
	bh=yrJ82et3mj4de5bHGMGo8C0V7xBVxSQ6fqTazodMdsM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XJN7psxHDpp4GXjsNfkTOLtqTVZ25oYnkuVwp26YN2Zc14nkLj5oolvFlHVpgw/Hf
	 2+QLJBavHNVCJHD7dNlv/nUwJSiFEoZxKh13Ck6po89Wfc+HDJGmn9ZCLT/2nEYTsn
	 ZCNqmMwiknbXVoIe1BVly3J35P4V2Ues6kHiWw7T/Fbp5HKRM8q2FU4VtZns+Pl4M4
	 iMKo5wPw9kFkOHrWNUkZaYpS1oQOs32jeUUbxnOzcHugglnQBemyiVO1AxMnmoGzkX
	 E7T7NMIUxYyEjZnIJyzqBg6e0wnITTul1cNUAOFb7EnVC5oIvRGtGM4SfWjAFzSVOr
	 Sc84sNn3gBiSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEBB380AAFD;
	Thu, 27 Mar 2025 21:58:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH RFC 00/10] Improve ABI documentation generation
From: patchwork-bot+f2fs@kernel.org
Message-Id: <174311270549.2230226.7159828218594723399.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 21:58:25 +0000
References: <cover.1737135484.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1737135484.git.mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, gregkh@linuxfoundation.org,
 suzuki.poulose@arm.com, james.clark@linaro.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, johannes@sipsolutions.net,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_145751_486136_53774955 
X-CRM114-Status: GOOD (  14.48  )
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

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jonathan Corbet <corbet@lwn.net>:

On Fri, 17 Jan 2025 18:59:29 +0100 you wrote:
> Hi Jon/Greg,
> 
> The main goal of this RFC is to give a heads up of a work I've been doing to
> replace the get_abi.pl script with a python version.
> 
> Patches 1-6 are OK to be applied:
> - Patch 1 changes the sort criteria of the ABI generation to use alphabetic order:
>   currently, it is *almost* alphabetic, but, on some cases, it orders on a different
>   way. No changes at the content, just at the order.
>   I wrote it mainly to use the same sort criteria as the new tool, but IMO it is
>   worth applying even before we switch to the python version.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,RFC,05/10] ABI: sysfs-fs-f2fs: fix date tags
    https://git.kernel.org/jaegeuk/f2fs/c/90800df0da78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



