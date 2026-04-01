Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EF9D3517A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcaVbQQ5aCgnXjD8dVRic/BzE9TceHQ0fuVdVRGuRmo=; b=oWq4zEKnPNns8tOTtViNUaEQ34
	YR8IFW884Wf0kwUweuP5KteN+Ivpt5v4Srgq4SRQB2IfMI85yyrZpYkF0NGSVK+1v1CXQRo6NantH
	AKCbd6KE732tJfP3u9juGO+6er8GiOJuqAuAtMAtzvTZ6rexprXxsQpbCgrIwanvmQe7rolLFYwVn
	pzzfMVYASuFdAR9Nr0EV9dEtOJ6N74T4LwWxXWZo5X+nS0yXRxxdu0ZTxt2isVr/3QbYP4gb9Oq3V
	cstQG76diiHIh3IRTWkPwMBM0au5UH+paE0538sHM9idzf3V6jGN7PsbfDC9T4E1N5DJ6eyNbDTkF
	K+vKzfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u3F-0000000Egvz-02ix;
	Wed, 01 Apr 2026 11:48:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u3C-0000000Egu7-1VkT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:47:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C95446015B;
	Wed,  1 Apr 2026 11:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0207CC116C6;
	Wed,  1 Apr 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044077;
	bh=J9xPXY4c9/hlpTH54aV46gW8mH+CjxJY3bUqufY9wWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCUAPXe8wR4D4KukxlibgmO7f8bkBCKfigB8j5EsIT6B+kKoZfWDz32pzlW44cQPS
	 O3MsLv002aQXCfUP8bktnHCfMQ9QcDj2mK2UU8gSBEdgjQBUTttDax18FD9JcEHpJZ
	 PnlJlLmc675E5+VI9L8UeQmCXpDRKE4varWRgAWJTkrK5j49rzmYphOcDbsDZYB3yE
	 6IPX7CdrVcgXZqF9m4v7O9Is70CeQkaApRxPLb6Pp4mIBfEyzh72ohmvI1X2poKEHC
	 Q1rNamnM9jl0dm1j8N4qJT8UZKO75NLgRa/7heioNLxzuoAZm7u6IVkge4QmDqkvhf
	 xU9zzyacEXuHw==
Date: Wed, 1 Apr 2026 13:47:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.0
Message-ID: <20260401-mighty-crow-of-upgrade-b17bd3@quoll>
References: <20260326133119.66268-1-andersson@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326133119.66268-1-andersson@kernel.org>
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

On Thu, Mar 26, 2026 at 08:31:19AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.0
> 
> for you to fetch changes up to a343fb1e03cfc9f6dc83a5efb2a8d33e9cdaf6b9:
> 
>   soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition (2026-03-18 21:51:11 -0500)
> 
> ----------------------------------------------------------------
> Qualcomm driver fixes for v7.0
> 
> Fix the length of the PD restart reason string in pd-mapper to avoid
> QMI decoding errors, resulting in the notification being dropped.
> 
> Fix the newly introduce handling of TBT/USB4 notifications in pmic_glink
> altmode driver, as it broke the handling of non-TBT/USB4 DisplayPort
> unplug events.
> 

Thanks, applied

Best regards,
Krzysztof


