Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F44C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLnKan3lFYDD+jvzhQNITIAxq798Ip34clQk5vThoys=; b=ZfymeXNeD2bWmzAzkYWv0ZL4X4
	CQxjLGHnp4lv8lwGQLpqNGcLcUhA+jyoNvc8ApmEkIuyjt/k9iRgPxkLxqDX6+7o+bGH2p8yeoc9F
	u94qKn4Wund+Nk+2eXa+7SuR0r40L2yZmGKet4XmpWpatD0CVXDKbNTCF0ciGRDq95WI0fy5Rr5X/
	BfQnxCkXsoBtOL71KsWdaCn84i4wIekvDEAE+VwBBMbfpCaNxLEgoXDrd88PeZ1j4Iw6sLhC1dv0D
	88d6hNRP6ME4rFqfiq7h0B2zmLneIZCHrVzeFOHO5TSKRIiKeCArQlfT26rEK1MnQjdddRWizgG61
	jYaRwnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLXJ-00000008SiC-1iQ2;
	Wed, 12 Mar 2025 12:50:13 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKVj-00000008IsH-1v9y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1741779856; x=1742384656; i=markus.elfring@web.de;
	bh=MLnKan3lFYDD+jvzhQNITIAxq798Ip34clQk5vThoys=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fwCA+hTv+xevWhkTQGzqZY54XO6nMElzeJc1/orgz60gpX4gGPsEy3THUzP2JCL8
	 uATjwFM9g8qat/TJbX+g7G1THZP1MA5MeHU6nSi1X/u8vBXf9npIopEpxmq6LwaIS
	 2CtcslgwC3F97QMnSc3rR1k19fB+56zD8GJum7845m4JJDrEpR0CdTBowzPJhaumm
	 vVWYiSMZ4Njfg77aU6rlvOx7a6hBMIJy6kM/EoTZbFdiPPxOJdLcVJwOo8i5n0epa
	 KaEyAZxe56MFUdzDPbXo9jLGEA0eM5BP/9JMx7wBwS4LBV5BQNej0Ugsw1EAj5523
	 7LqDuVYMMHgNrOHEGQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MoNZM-1tPpFo1ODw-00fcM3; Wed, 12
 Mar 2025 12:44:16 +0100
Message-ID: <9ef781b0-8a63-42b7-91a2-fa8a8ea3c0b4@web.de>
Date: Wed, 12 Mar 2025 12:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4] dma-engine: sun4i: Use devm functions in probe()
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250311180254.149484-1-csokas.bence@prolan.hu>
 <885ceb3e-d6c6-4e7b-a3b6-585d2d110ccf@web.de>
 <81f87d39-d3f8-4b6a-91cb-b0177d34171b@prolan.hu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <81f87d39-d3f8-4b6a-91cb-b0177d34171b@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:80YpDH0o3hUHkweOLLEIn/ZK5SDX0jpLC2Q+zbRQrqjKibA/0ho
 NbKKWd8SOUb18XeqaK4CFWgRzmMNdV+5QRagLrkle67BCLcpV2u8fwvo6RcLmDZmJiXKZ/Q
 727i6hAL6RhEmYRmjeNpRINEwCdFOBlhf+KsJzcgS5TFt6ohZfpEIoMt1YxkFS2kCZce+9h
 J+GzvoTvhZoM7eyZdcPUA==
UI-OutboundReport: notjunk:1;M01:P0:AV80ruHJYxs=;dZeG8Z3LKpqUsPmFKaUNL3FOj3i
 JTXsrn9BP9hHyIulU9qz8iv24czCZwqjFT5FJ2IbPMIaxFD1njxdP1gyClAOqkvA/eyaaQxtg
 HHv4ERWXjJG61uWD5mG0SiNv9y6fwrtmBbaROCl+f52TkQDdwHLumuNp7IRBqcfVEWVrJPy9Z
 2OQNrmyHsMnQCniE9Yi+vHd4Sx/+4ZFWkQFvCsrLk7iSczyVNKRYqGruKCZ8DJYqhfaWBBO1d
 OFCKC40T5lfPxWBdYZdw94/0N/MOAxxc8N/0xRVyASE0RRXCayhk0qGWN5GE7QC+Be3tVoyQo
 FiDt27/FgkM0jooz8FK/r9Qxd/fj5aemv58iRvJ+F5TNdggpBQ30k7TShiP5N3dPBogufQ5ii
 FHdWIuf35zk8KOLGuXMUIDo2sZTgCRfjmOL7rytrCqJSdUeq8kBjQWn+X9r1sqS9eqsVj000A
 hH02//eHL6Ohw14cwo368Tmt9EQkPhxDHz/tYMIBOF/6hkJfOOSQXvlKIDG4eVBxU/NNTLZl0
 OPBmFWuF4cbk0Bwjw6C85/gJRGStHJ2d02NB9bj7dmlfOB0Nm+kk2Fuuty/sB5emCm9mY7Kg2
 lgPetwHF7Kt/5zKZmqRtQUf0yI2MsaO/F7VWvFEE4+aojjjIp29K5ChJxVyykgLlRK9EjhSFn
 0MaH/Q/JxrWXK3R7eeY6J8SkAb4eaTWCXMSP7Y8xjISitwnGdmQnIt7epJP6zW8VCZm9ON1bS
 fddlbe6Vct6TL1F2jIpATEGtRsQ3o+vKMlezDY+Qrt+lVomocTB5YQ2c+3/t40wIPUniRpNJt
 w10O9p7e6j3dXZlBI7YM9kM8pk4oKGjPEEu9KTeQS+RkDB17TW9jQ/Fi1zw+LZedr6qknA5Wj
 edKjYr/l0uVuyZQp2W1ICDnzTPWX+mvZpgnSLdXfD/WGqwV/E0/a8/EG2DiZO6JE+gKhkRM7u
 hJ5QvazDMa+f+zFhMmDA4bbqSwvNX21ItGxElC9XevECHHwJxKiSQkHPKlSz1Bt+15UNHSnVN
 bUqya6rF4/K46GqAvrS7Tk3lNpzGXHupHQYXbVxHXFRQF/UY4S6HtX7o0OOh3h9t/u5l5o/Jk
 8cpbyFnO+ls+tUEuCY+3KBsYbI5YvRWI3ToY8aDFPsHz9cw7c90qbXkUNVroMqwCx2VNFONDP
 NWMGr0SMtoGKNlO8MC/T/EBgMuPgPmpGeeM6ev9JvRinbWADLkw9wfpY8+a318gv7yPzSMfGH
 bfWNLxyyXdFkh9IXuEA1El9iHIuCGX3nm/4GeFZNcDJcxVJp0Ee8GF4nykQWnhTuLo9rjuY9z
 V/LuSbrQgbEHy2k/d7yJHFZ+s8yk78YbmpnOdAoqU0wnH4I37Wlhrp7+f3d/hMI6Vu2h+/D3J
 aubt/z3jPkabRZR0xPONPeBH3gJjRHqat1V5HsUe9QX/rkxMEDVFzKiHr/d50ybpUDUiOvaEe
 yhKJ7nw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_044431_863417_E557754D 
X-CRM114-Status: UNSURE (   6.41  )
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

>> How good does such a change combination fit to the patch requirement
>> according to separation of concerns?
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/process/submitting-patches.rst?h=3Dv6.14-rc6#n81
>
> It is a general refactor patch, it shouldn't change any functionality. I=
 could split it to one part introducing `devm_clk_get_enabled()` and the o=
ther `dmaenginem_async_device_register()`, but I don't feel that to be nec=
essary, nor does it bring any advantages I believe.
Can it matter a bit more to separate changes for the application of devm f=
unctions
and the adjustment of corresponding exception handling with dev_err_probe(=
) calls?

Regards,
Markus

