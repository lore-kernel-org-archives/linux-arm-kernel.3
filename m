Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6D1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEaMeaKe2woigzgc+/lPc6No3aXg9fhiN7bOQHOaDMI=; b=5E13FyBraZ8QzoWkKtFH+XLcOh
	6RDm6ECpp9W24eMIjmcMy7fKiNOyIDJFGoHY20FxTPpmk0LuvVSuX1B/RXVjgec+2dmpd/4KT6d/8
	74UmQTGidCjfXQdaqjxAEFFVe34g3LV55mS0gEiXQWbGeW+fCj+1YUYGHrPgvWkMVPyEtEVlowQ6f
	zn5Uyp3KgX+bQhRU9Iq29VfI+jXDpA+Qo1qHxWZSlBt5rqoeyJsPgFms7OAhR353AUx0OpiCA2q25
	ZRU6Oe1zYEBLiV0HLcaBvKxa4NcDBR3IWHfTTSN+22a9a/apG8V7s+m2FC6u1bJ12P2yNy6H9z5RG
	P1begkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJ90-00000002H51-3mtY;
	Mon, 14 Jul 2025 13:22:58 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubImr-00000002DeJ-1kIQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uEaMeaKe2woigzgc+/lPc6No3aXg9fhiN7bOQHOaDMI=; b=ZRjhVP93T+UwvSXx6irfyT3WJa
	UmczJCdh551T5xTcztt3rg8rTH9hd2iVJYlRj4Y+twXyC2xr+/YlVfcZkxhP1QuQc4f5CYSlZ7Jp7
	oFW1K8BwP4wE8ylM4mavlMLoeFrAcRvmT8egMnZLYpQhbKQc/bSNu+FmkqDQAJhGauCtHjU44SaLq
	H4lhnF3Ic7ALdJxXzNxZhrZ6SZvdtToR6D0C2jeeU84loAZf9QMJHuH/GwJPy6zyN1e1VgMoaepez
	+Dof4/hoSRqFNDTOs5VXsd+b2jsLF/XpwAkdH1k8fNFxRd2blC9OpxDMtFW3TwtmtE5AKxkIgkB/M
	NoOoq5mA==;
Received: from [89.212.21.243] (port=37122 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1ubHmn-001QUg-0K;
	Mon, 14 Jul 2025 13:55:57 +0200
Message-ID: <ca5c6c3d-3053-415f-8b16-05cbdf530797@norik.com>
Date: Mon, 14 Jul 2025 13:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] i2c: lpi2c: implement master_xfer_atomic callback
To: Francesco Dolcini <francesco@dolcini.it>,
 Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523082931.23170-1-francesco@dolcini.it>
 <20250626075837.GA9216@francesco-nb>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20250626075837.GA9216@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_060005_922214_9B1A6884 
X-CRM114-Status: UNSURE (   9.87  )
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

On 26. 06. 25 09:58, Francesco Dolcini wrote:
> Hello,
>
> On Fri, May 23, 2025 at 10:29:29AM +0200, Francesco Dolcini wrote:
>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>
>> This series adds atomic operations support to the imx-lpi2c driver and split
>> the previous v3 patch into two separate patches.
>>
>> The first patch replaces the open-coded polling loops with readl_poll_timeout.
>> This improves readability and consistency, and prepares the code for
>> integration of the second patch, while maintaining the same functionality.
>>
>> The second patch implements the .master_xfer_atomic() callback, enabling
>> support for atomic I2C transfers.
> Just a gentle ping to not forget about this.
>
> Francesco
>
Hi Francesco,

just a heads-up that this needs rebase on latest linux-next due to
commit 614b1c3cbfb0 ("i2c: use inclusive callbacks in struct
i2c_algorithm").

Afterwards, I was able to test functionality on PHYTEC
phyBOARD-Nash-i.MX93 and you can add my:

Tested-by: Primoz Fiser <primoz.fiser@norik.com>

for your v5 if you want.

BR,

Primoz

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com


