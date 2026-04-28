Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343EAFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 14:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dnnnifmIzpF9Ebh8L++t76XOo1eryK5OY/IV/cdBnI=; b=3FbOlmJkespSieUAPmR27/l/vR
	p96sx8Yk5oiuzI48EsWBJ8PJyXnjUWbwLXd6suucW1zTjRsVx1VRmkOHYb3zFrwLOHGW4J8zIHC+b
	nolgwDcTIb+PU+1rwCRfR7DIBe0lGRdtalOmY6gycBq1IUt/O33OlgrfveyZeqsZ2cQtJ9/Tf3Sp6
	0lyq3vyiyhRb602jB2HthZ2h784oH6cT5i7znZ6iuA0fzCONcMsaVsPdAtmp7HPLL5s6yRNLP2XQc
	OwmA9Y4FmkasPloobv3KF9l4ixESDMekmmxwNa3n2zM+yE4Hf9Gq/Hl1oO7Rz/Po3w0igzGXqhWEM
	mgh+tjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHj2p-00000001byH-3fmw;
	Tue, 28 Apr 2026 14:04:11 +0000
Received: from 5.mo560.mail-out.ovh.net ([87.98.181.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHj2i-00000001bxY-2PNb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 14:04:10 +0000
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.0.24])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4g4hxT5YKwzBNPP
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 14:03:57 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-f6m5b (unknown [10.110.118.251])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9E6451001E8;
	Tue, 28 Apr 2026 14:03:56 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
	by ghost-submission-7d8d68f679-f6m5b with ESMTPSA
	id e7i0HEy+8Gn7awkAA7T7Mg
	(envelope-from <sebastien.szymanski@armadeus.com>); Tue, 28 Apr 2026 14:03:56 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R00242a48d6a-e56a-480c-88df-638997601774,
                    74DB1B90E6E4B7223053899FBA067BA27D68656B) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 86.243.239.229
Message-ID: <ab6b9b36-f08d-451a-9c2d-ef27b813d744@armadeus.com>
Date: Tue, 28 Apr 2026 16:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 2/4] i.MX arm dts changes for v7.1
To: Frank Li <Frank.Li@nxp.com>, soc@kernel.org, arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
 <20260330141444.3789193-3-Frank.Li@nxp.com>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <20260330141444.3789193-3-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 13712616442643404459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEw9tve48xeuW/0pHIXopn/l2+Ei/S3Czvgzi950ns5mJJQ7Ihj5Jwxq/suGN/tS2DUQJj0rlIDVk7jNsZz1bo8ZN6Fg51uKKRXF8P8gKa91T1u84S0h3RlUMCs7Ta43+n6OBx5uJmfLeoH58RspEz+qWrXAL98LU65IIyamgtukazoUmw2z+jvgRqJJWqXZAEmgZhPVG+EQgxULZE9p5QtfEyIyNHhMiOsrVadKWfn1BJyg/zC0QmEJKj+JnkEEYbqfvNkh3jFXMjsEazYHhhG7sXgMnNEvD953xwzvI97N68+Dpt39gZx+j6hZ2WphiS6MYxUF2JOQAQqH7quLF7kMCjPkNIv9xMbXbNMoHb2RAuMMMce2kCMyAylRlS3E/ak3pRIydmHmngo6n9/i33SJLHZ+RfS6agrv3jUEdg14yljJIjNgnPodUCG/9iaFOwQ8YEa0xX3a9SFBXwtyIb6syj02oN6yr4FwZO+BUX0iyf6SdhyxCJqPHJH04YC1PTpy3eRtE/F+zp0Pl/5izFiA0YX/Jj+ZKZvV+sDj/wYSADhpA/8RaJkKNe009Cal3iGWIchvcBacsKbO3FKQp3QMd4FH8KmrgTwCtM2qSqsIgSwbf6TLNOHrb0hqvDFR+3LMo0FjrGGcum8u1B0Z4L4iK2VQFH3/25lvBBta1UhRw
DKIM-Signature: a=rsa-sha256; bh=1dnnnifmIzpF9Ebh8L++t76XOo1eryK5OY/IV/cdBnI=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1777385037; v=1;
 b=ZkpXMjmVLYC9A9pg4wmWmdqk76BC3hBDDXQtA/D56Kq8E8T0/7tbpq4Cwiw55blz/P4qQY8m
 aeD+HUMWH4DXpkpiLMSnw9q7wEqePBQFN45Bqp0MeQLuoBFWj+L8VXHCxCjL1Gs0KClDpXJcceT
 TSKqofDzgm8zGct3MWbcq0wxSsQQKnwwScekth7F8ZW0BsPANHbgjevDcwvz+iU+06qEjk8I50w
 P9KC31DH2MP2Lc8/49lk1qI5ks48mSjgDHpx5wXpqjTFd+SUjY9Y1LhJLBk1T/saoUoBiDEelgP
 Jak3a6OVXpAR4mL+aIprl/rM/rh6Lgrq1XUkVKQvALXgA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_070405_770901_C4953208 
X-CRM114-Status: UNSURE (   6.43  )
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

Hello,

On 3/30/26 4:14 PM, Frank Li wrote:
> ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy

This commit breaks Linux 7.1-rc1 boot on my APF27Dev board. I see the 
following errors with earlyprintk enabled:

[    0.346162] imx27-pinctrl 10015000.pinmux: unable to find group for 
node i2c1grp
[    0.354438] imx27-pinctrl 10015000.pinmux: unable to find group for 
node i2c2grp
...
[    0.636217] imx27-pinctrl 10015000.pinmux: unable to find group for 
node pwmgrp
[    0.644346] imx27-pinctrl 10015000.pinmux: unable to find group for 
node gpioledsgrp
[    0.657247] imx27-pinctrl 10015000.pinmux: unable to find group for 
node uart1grp
...
[    0.868102] imx27-pinctrl 10015000.pinmux: unable to find group for 
node cspi1grp
[    0.876513] imx27-pinctrl 10015000.pinmux: unable to find group for 
node cspi2grp
[    0.888903] imx27-pinctrl 10015000.pinmux: unable to find group for 
node fec1grp
...
[    2.413181] imx27-pinctrl 10015000.pinmux: unable to find group for 
node gpiokeysgrp

Reverting the commit makes the errors disappear and the board boot again.

Should I send a patch reverting this commit ?

Regards,

-- 
Sébastien Szymanski, Armadeus Systems
Software engineer

