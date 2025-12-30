Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EE6E94107
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 01:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpoUGD/nQvuwJGs8fSJGimVrIe44lQKhSJUrrOso058=; b=ThyMsAj0Gcp5JaEh5iCMK0ZBib
	eIBtt2hdXQLmkOBtLziWj9ZK87hAR0DSogXT2BALhmvtdZ/s6Z7PxR36Fk6g5FolMZ4Ld7pPfjuy/
	zmzNoaGRzVJNWHWEBTcTcjD1Q1hcH41MAeUfWyInOyLT4yvBHrtxd+79Oc66ULQTXinI427GxDAEl
	pU5HLymuu4i/XAyxUtEBrMnCFgEYJpShHYYWaY9kvtW//nFMYGKOvWeWEzJwO8F2ioxKjgIyxiQG7
	pirfoZXhaF+GDvztCYlzucBg2Qr86HB3qKNWmrwJDe+60XcXvCSUNMv2dCE5jXQ+UIpGL6LZAVSB/
	VMGYJKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOvk-00000004HMl-2IoE;
	Tue, 30 Dec 2025 01:53:48 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOvi-00000004HMN-0IF7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 01:53:47 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dgGMp3Cbxz9tdM;
	Tue, 30 Dec 2025 02:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767059622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpoUGD/nQvuwJGs8fSJGimVrIe44lQKhSJUrrOso058=;
	b=rRJ7mr/JsYyKdWNKh7HM16eTWtEuXu3tGnUJvaLOG+/MmkoEP2Ld02L3Pd+X9FMr4VCDjC
	r9ZyLZc1pkNFyA6vi4mHIZ2gt+QCZu0jKpNiRErAfE4us89kDbNFrTLRaBNjkbCQN+QNZ5
	I9GR1TtcsrLkuugM0KLHyh9XDpLRWK72IGVTGBO4LcayOQEQ9SVfPFBiBJIX/37C06L3LT
	uJe6KgnpkbncENJQMzxeRRDWMXN+wDVViQUCSyG7OrWhKh5JT/F4Lvm2pIMW9AgDu2He3z
	YGkgcySP7IiYm6ufYpWUZKWBroUnP2m2Q3iZKkt2qC20pomA5LK/aHJJXIALKg==
Message-ID: <53ea529f-3538-4ab5-aa99-0caa6729b4cd@mailbox.org>
Date: Tue, 30 Dec 2025 02:53:38 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
To: peng.fan@nxp.com, shawnguo@kernel.org, Frank.li@nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
 imx@lists.linux.dev, kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 s.hauer@pengutronix.de, Rain Yang <jiyu.yang@oss.nxp.com>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
 <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
 <aTKVMAMQ6v_BwD6R@oss.nxp.com>
 <9b593731-898f-46a7-8ee5-68f8c170351c@mailbox.org>
 <aTYxm_dfMwF4H0_b@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aTYxm_dfMwF4H0_b@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 21bcf49a433a8f6c4b4
X-MBO-RS-META: 4dfs449y7anjdqiphj1bofd5kx8drorp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_175346_272159_10420119 
X-CRM114-Status: GOOD (  11.20  )
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

On 12/8/25 3:02 AM, Rain Yang wrote:

>>> Okay, I’ll submit a patch later.
>>> The commit message should reflect that only CLK_GPU_CGC is enabled.
>>
>> The commit message , and this change , is unrelated to GPUAPB clock.
> The commit message is ambiguous. Could you clarify which parent clock
> you are referring to, and whether it can be enabled by CLK_GPU_CGC?
> If it was CLK_GPU, CLK_GPU_CGC can't be able to control it.

The commit message clearly states "These new GPU_CGC clock
gate the existing GPU clock." and "GPU_CGC as well as its parent GPU 
clock." , I don't perceive any ambiguity, sorry.

Frankly, the whole GPUAPB discussion is entirely unrelated and it only 
stalls application of this bugfix and keeps upstream broken. This is not 
helping.

So unless there is anything in particular that is on-topic and prevents 
this patch from being applied, it would be good to apply it, otherwise 
the GPU on MX95 in mainline Linux is not working.

