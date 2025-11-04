Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453A8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFNAU18Fh84qRAvLmldHtwobRAG3DpMxVbbi0K7tM0A=; b=cjVbo1teXITOvlPLLBpL6Kpl7j
	RmR5aDiv3JUGRNOJo2EoCzR/mtUxAA5iE7EH1Kk17H9cDsZW/F4kA2tq+MD9q+KKZUasCWFOtd97c
	QPzklA8qKqc5gosENJ/h5LewvZuzqN29WxZx98HGgn6tEk7sENiqEtFcuRUbwhnxAeqKJ0emMXO/u
	kSICfEUiWyssgAoNtx4Qi+BzqXwz8R/UTnwCPaQnJyROLq66FgZDdrg/xJxvoA6326jri6yfsldAz
	x5s4qYce6Tx9bSSwwnYg3ixhAVcM/JxFwPreY792LBT7QKUjSJC9szdTuNnAjnpsJxMGxFTzGmu4M
	lDV74zyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4oV-0000000Aq8i-0A45;
	Tue, 04 Nov 2025 00:22:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4oT-0000000Aq8V-32ID
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 00:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD229601D7;
	Tue,  4 Nov 2025 00:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BBFC113D0;
	Tue,  4 Nov 2025 00:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762215736;
	bh=umMkQ/I1GqBqTCSFshRO2Q3ySgL6SDeXavuMjayIeOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gs0d4vQdyC9kPDBtTXowXOfaJUt6XgcIM1HB1t1GAQ48bwekhthaz0mOB9jATQP0+
	 7XvXMQKGAnc4NgF1K3meZdHZEBWWFTQZ6c+ZFqVvSxZqIkgy1JyMJtivkN2wdAJgnu
	 e6MPj8lXU31D7NsVj7N6fOnyo1Ynp+xbD2HBQSRRB4bZF1+dVwGFaHmPGPtLRZWibw
	 //NfMdjvfctJQKSWJlLWndI81dFWqmCt+XmNQSoaETZ8xHBrmjOdUHM9U1GuQYHVuc
	 WRjbw7TDtOXwgzUXoY8ZVuENWd/EpuePKo3OJcqNswzLz733CpRC9IzmGLM1k9N2ei
	 AutSUuxE0WT5g==
Date: Mon, 3 Nov 2025 19:22:15 -0500
From: Sasha Levin <sashal@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Sven Peter <sven@kernel.org>, j@jannau.net, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.17-6.12] soc: apple: mailbox: Add Apple A11 and
 T2 mailbox support
Message-ID: <aQlHN7Nu-1aAyrXp@laps>
References: <20251009155752.773732-1-sashal@kernel.org>
 <20251009155752.773732-9-sashal@kernel.org>
 <28f4950a-e3eb-4a54-b867-67bd269b8407@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28f4950a-e3eb-4a54-b867-67bd269b8407@gmail.com>
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

On Fri, Oct 10, 2025 at 10:22:18AM +0800, Nick Chan wrote:
>
>Sasha Levin 於 2025/10/9 晚上11:54 寫道:
>> From: Nick Chan <towinchenmi@gmail.com>
>>
>> [ Upstream commit fee2e558b4884df08fad8dd0e5e12466dce89996 ]
>>
>> Add ASC mailbox support for Apple A11 and T2 SoCs, which is used for
>> coprocessors in the system.
>>
>> Reviewed-by: Sven Peter <sven@kernel.org>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> Link: https://lore.kernel.org/r/20250821-t8015-nvme-v3-2-14a4178adf68@gmail.com
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>
>> LLM Generated explanations, may be completely bogus:
>>
>> ## Backport Analysis: Apple A11 and T2 Mailbox Support
>>
>> **ANSWER: YES**
>>
>> This commit should be backported to stable kernel trees (and has already
>> been backported as commit 37b630a26d235).
>>
>> ---
>This patch adds support for new hardware which is not just a device ID
>addition. None of the hardware that depends on this mailbox is supported
>in stable either. Please drop.

Dropped, thanks!

-- 
Thanks,
Sasha

