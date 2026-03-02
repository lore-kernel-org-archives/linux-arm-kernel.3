Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D5DEB363C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8T4YCww+EZIzlhUopgp3ugCAlhE5XupPTFrter383o=; b=43kQ2Fw8REtTiatpvDBPPacoXj
	nEihcG40da83K+bpb7CvAyN5gEvdCBDbvgVY/gisht4dmXoGX4mg73OhymWf2454s4G4PE+xy7xDX
	x6Sf1ZwKqMqMxm92pavKpgL0fEO62YruMwAQEbkWlSfEusD4RI1IKEAPMFwIY/PteGfhFY6Mq3rKF
	sxKvDAjKSMKDm0kPmMqeNRaNWiXt2vjFBxuyo5XBNF0L827FQfKqWc87T14tk0PVLQEbi/VJKCjOE
	C0eCjqFNk8x3YzFEJtgFCZ6aHeP2bY8ie2qjNr4uzkfCexcR/0wk3GYbMjMSAV7TSs5MxbWk6h3yG
	sUhWhU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBzs-0000000E90F-2oEA;
	Mon, 02 Mar 2026 22:44:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBzr-0000000E905-1dAr;
	Mon, 02 Mar 2026 22:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c8T4YCww+EZIzlhUopgp3ugCAlhE5XupPTFrter383o=; b=XzRYLrK7+kijgDVQLKwtgEtrWA
	+J/40qSPV5iiAmzILQw8wvDKwRwArnjN85bPc8G9T6EgmA80wPC1oYqNEGZv1JLbWFVpJ74ts7lsH
	s1ymHRvx9TUFbGbIQbLh2ISnEoXU90UgTo6/4s7E7QULXde84ChZeq6uuUu5EqOztbpv+zd298oxJ
	DFEMk0IoM15JpQRUDZ1ufRGkjVtpLgEwYxZJ41S6xXmRFRGZn9je2YcqHAA+zV/Nhky6OLZms1tye
	ug52qFP50MddOcqJ1Zasgrvc/LKAWGDcE9IKoZUKEqVSl/aJl/2gqlP27ZHgPV/7NtroQLetso9Gv
	6pFnkY6A==;
Received: from mout.gmx.net ([212.227.15.18])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBzi-00000001DT5-0Ch6;
	Mon, 02 Mar 2026 22:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1772491437; x=1773096237; i=wahrenst@gmx.net;
	bh=c8T4YCww+EZIzlhUopgp3ugCAlhE5XupPTFrter383o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=p8dexbwgKKOCYpqqpuI9k3YgkqRc1Wn8K7xk85ItV1X7o9mXUqpgyv2KhtnYuGHa
	 +wf4tGM/Uz9CIgGlQr1dQM6vtoLY++Q/qr0GoaFWr6qu5qyTS3pnFqNPMZc35MD6v
	 sdCFRPMyZN1+Z0iIWv8p5gIWN1B2ZMH+7RmPLI8La/2Wwo4cFn/gxFM707c4n8e6T
	 wGtaxeLKdgtULtRx5jQG80IVjbI8wHwgezSxogCCSNc8HmjITK7Ye1phmj97+x7pT
	 8tSUQCgjrcCNp9+uR9jlf8+L8xOPpez7UgytNkz5/8k13hnQRdM+cyiOQOogT0smC
	 rEZ+vbIfmFbMcD9FUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXGvM-1wB2RP1Q8k-00M5M4; Mon, 02
 Mar 2026 23:43:57 +0100
Message-ID: <1028109e-3b74-49fc-becb-4eca2f6bdda3@gmx.net>
Date: Mon, 2 Mar 2026 23:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] pmdomain: bcm: bcm2835-power: Increase ASB control
 timeout
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-3-40683fd39865@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260218-v3d-power-management-v6-3-40683fd39865@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/dKO6vh4W+Eps9OgX+rV9aEaqsq/PRozC7CUP6kc/kH37O7pzFk
 tckrAynrTppoU9F2x3h1qM8tbXvbillHCQ2RS2g4gSeAHFaVCci6NLJPsOS3Jy4f+h0Bnc3
 KmGN1QUkd/Q3/I+RbxRdgRMAxqzmL3pmG9uKVi+7X+fpkPcpHnlESrYihgruiGOtSkobg3J
 WOBjo2uyY40UH43F8qTTw==
UI-OutboundReport: notjunk:1;M01:P0:x+yb4fqT2vo=;jjv6eA4H2HO+PdrPWtWgZSOrnTt HDFppPLV4o+XmHDMnN6HVal2xE044MQaNguCwghlCvOAv9FLGY1FmiuEIHeEX5edcsPMSkTat b6piSgX5pnuGFDN9SoiA686fQPpaYHTBpIIRnI39NqsB30TpbAi0peiQQOsA6ZgekX+mYU2Rl +E+t2ygUW9/1xAJzHmRV6jpFhhPJq4xKEJcVOGFKkWpzEBDlUct0ql0ZUDIdSPGMqfS3grhY+ jWtF3cGbt0cjbEDrHXEybQP4Ze4a/EOQoZX/C6Sqqgumb0WC03QnDKZO3EScaP+ndHOt9kyMA CUf345k85TuYoRrpCvqXpauKLVdQj6fe4INZdyC/q5fEOi/nBMfIUrI/jpbsyKEMrAlyv1NtB d/9kls49lM7gLxIy94P8hoFfZD5u4//6rjXpF5b4ECuKh67Lfa8NLEI4m/ooOIMClyutLI1Lf lsk9821IojE7qhwXLr9AGIwFAmEa6sYrK+ka//tfN4NTvnHdYdtf1J1nLx2MvUP8ONAWfG8G2 JSa+OkqtmduA80bSRuA5uhk+qZapjIGsY+RBBBQpcQ6S4j7m6p4l4y8IVOYah/gnmwa/fSbmO OeLU97737mnAc6Hhh4VqTNuBIPFgp6W0E0NtZn3SG8w2/mMh/Umj1RKcJYcScFU3XFRXnz6e6 wdT/+QNQOzTQYDkuDbIdpq+3Q7CtlFCzjpG4d/QQwbTSuIaNhBk63Q5Bh8Yk99QAiZoDIOLGC +MbaXqJNr5JPo4GRqwAVcOLYPi1+P7qjXUwGr4g2z+ACU1mnYYbDMq7Rb7d+4dUks1vbyAtHb UMK66CTIcD28bgZePEcHX4ODoDjP6ouTN9GnTpzQYdOqbS8TjEvY7Xu+VYtwd1oAgTvtRZmp2 QgLugV1XchXir3nw9Uw5KGB54ciG9ofR7wsFKCw3Nizolb5CI/Fh8vVy78GdB67GG32utkpV8 M9B3L+hRIXwYuzVNGgM4BYhFuKyFuPtGMPKPyRiAaXagBerGZdnTAYn+j0DSji3yInfw6Nos/ 3o0ce3SQVIlZhA02x4uMKrbdBTtUUFoZxGMwoOqzFcc3Uyf/Gkj5TXIqURDWajDc94JncdZQz SgUdBjSHHcL5+lOzJEQfG04PbAv87CT/ZBLV53XVK5M0CeeU3NWCZkQoyIQncP0ZoVCV7LN7e W5oQucaBsCyCVt2z+lc+LOHVM1zXDaRYMO3uGiqulYEuISyl+I8VtrX4qgc70dGYlS+ffS9c1 mb9DJez4uw160QvB5tpX5l09yHg788/9vjZMb13zpzdG2k/yc1N+GB+cMwDPu+IJGDA66K1G7 MG0fzNS7E5iT8zZwWy4KTAhOXmwbt4XyW2yW5CNjjTryvHjfIqQYZHkjx9qq115IF4eQmV0eO 3MNLNDxOoOuaW1ZWrsBBAe6wLEXL4COG2hjqgP8IDEFRcV81srINe9C6gvH/+507XLByAmknh GRO96CuqKayQnG/B2GmwESQBNquJmfZXBw7ShBwY0osInZyoD/eOFKAVAsvRTNxdNjautfE7E k0qY4XBcWH4/SxVbYhr9pUQlWFdo++9VkL5EguNpydL386NnRIkKzIA+V6fsT26w8ZCUsK2cR VSaApwHxNa7Lg0wUtalYIiUhmKlaXExOxmdNk0N1ENaVDyh21Lz64TkTUh19YgyLmq0gJU/dI KBzLSa11Mi7/0GcCLJrLTz8Y6HT1f+quEj6VF/TJTXiShZXAwmtWpFR2TK1F3X4myjdOSy1QL 15CG8BS3O7C/vB7q437noLe5fIR6ntLIV+dJEcp8BUWoQ+qN6pJVO4txL1t5CReDrWpouYGbC gEKBDG434NkTLmPSWeygw/GVAbiPIYNIQhjkKrop3LIxnNOL0AgrEQhuXZz2sbt8IunelUUoA L4BR3ar+etcZQgLU9GpWKNWtoSJGrpFdvfuuTEd10Hee0nkQJrXZgmChDmsoDc2C8IlJgFbcr vK30ZEjMbbAkT1mdk+PYzcYtZ53JFsAWtinmH78xQN6a9S2h7kB2s/i9gut+x7I2ZmEfjA599 Ek8pO91GEprDbMG9XKQgmQDGd1jR8sGAyGBFPL5XN+hOUOoOqT+3XRGvwSYOmDMH7fUMzh5yA Zk+FojvFG4t2uB9loGtfv3ZgaHqXGcAplblEF+fIrif+GFWQsbPaWV8zk68DqNVQ/nsI51xTu itBM7aXhk19dUOzKgm+TUO9bKegFWPKaCczasApqDkekHSHCbBKEJP3DiPOtLyfGLGdkYwIqu 09D5ifHU4Vub0eaxlGwxcN2lG0rafUPZ2e78hDQ1h2i0/RM403GtQ1OS0kp1YrkefF7gw1mwk kO2Loc9YrE/S4oQgTA/FpZE5O+9Ea6dYRVWHgJKDRAjG7oOYgbDZLKKs5QlmyJtbh0wO9nh/R Rnd6jDf5P9M4tNAWnuz2Zwn+vD2niT0LY1TFVVoahA3eMzpHfgMTxVa51RzcDVus1wmInDYCW 7nAnCkU382+GlSDxRU88J8jteg7+9qWkJzh0iqlH6g7iaimk7THsc9q7OQHFkJvSjGzZK+Mke fVLmCi7UjkB+sW78zLdp5JtgACfsGQtQe/qM9QgXXakEC/pzdH3qzuVKidK9CJFGY64ULG7bF U3cRGcO7Tjz3nsz6PM7WjP2wvpIBQrhfimhJ/8+7ZLro247t6M1UlsEwfGN/CZEvzVN0slNOM Tq9KqmtMDm1RzfMwsgthfbywYBP/Sqgkrdk6cQEsuM5O8SXyhdI7a6VWuOaXLPws4eiyiC1K7 qOT1/kKt19TbLVe3sbWjoXKzkfPtJBcqn533ZMciJEOoUb4c8xWwBYn+NhX+aI1dxuSSul+7b phmgSHiEaUJMWW7Ts17VgAsDYcqRQohvuWNQvmEqi4S8k0AG6tUIaxPD1HXU7JL255Fudf1Mn elxk6P2L7bzN7FtOe8AXu3N3nt99xBfczD4GUzwFf3G225jd9hmKvvgguzwjf6FtqmXnqfKrc QHNb6t4nzAzgkIMfOJ6CICTRfdCB1gnFE+z25Txi69TxDxVJw3A/hpUCOmF0CikG1bScRnUtS UHsqgtuzXEY8loHZwU+h+v9+974faXE8x3ofRwDQcvXSVEOfk1Gno/+wcmwmCrAUzlVGcWX/d sGw5isDPLFGz/o4Xn85LlfZ3us2N8eF0/LzLjxQICktqhGDHSGw/2pOV/eYjzijdEMRuW9a/Q g4XmU6i1R0x4DJlV63xK+j3gb5SNZER9lnW5RCNv9ErhX5P/bprZYrQM///bW2ptV6Nqfe+yL 7WPYwFDK8TOA+AjMB93oBgDaHafuItCqU8cB/IEpmD/0b9S9NpzOrSC9BjaR5qr2Yt8l1wF37 bLfNLooU+z2zZCN9meTIO562atqMHmKKJ95spwun7HjQ6/IUUI1SBhdPH+pkmC2AkMY/vfcx5 4Xh1EzofnrZOhe24Cz684joTiBLWKdUmg20HEaIavq7WOGRp319HvzSxkOebcnFkg+DOQ2JiV 1wOA0O4Nu/iqW6SHysqnbCeg9bcKBtp79cH+deIRIrXZRz2iOKI+Wc38XJ/xyNppY1K3qCyzH vsMau+n155qdqfsxdlCiWnZiJKVlylzNnvqRjUZwwZnQ7W1gRzWQRa2/w3LRLyhk/RTM7rGH5 qxOgjB1JhFDrG8MCH+E5WwLWHJUm0u6Pa/KfyOASJO/39lVRoQaLNfzmOKowAUW1xCTUbxuAS jBaG0Z/cYE/9r7Oh8xhHxYiPPRuGGow9GpsRYp8f773PzA7IPSnv6pgqY28SGWB9J6dHpDOfn 2Ejkg7U/I7meIoBsQNC56gFG97Z0qmRhD4BQJyeO4ECv9n83/JcmSG0j0r4IXcg9CcXUwzjow qic15LSghf0xZmxMRnRGa4ywh+iA06gJNJGPhNLYGKLnApjd0Q+Gvk4tM4ve/4hHR6z/LQy0k
 tMM42XCKoxOtTcJ/9e6ET+2+kmTWyTVu0j1uc9G7OoUiuvn+yoXdgH7uofp03JdhWSJ/1ue0u JpewtJD1/RlEBOl8DCHamMT/GTiqjxQ8yrZkrOUMYaXOHhGg05eXNWw9fZECMqnHqDuNSXUWW uWA1Gmanx6/Awi2BO0YSU+EKvGwc8GcYJOTon5WoCsNeEIYnzvpIg52vghAJxyNKtPMU9f4tX yGas82GF+C6aBJadfQYYwhp6XYePO+Y/ljasxudZNbWgHmXR9zI300fUVfcL/ze2fAtKkQyji 4xVXAFkzoSl1faDPGEBmdPNJak3duZ13jKjNNGGNo5eEr5+0MXYu3vhiyNiPnGZpN8qKHEF67 InhxuG/n25vgLm22FEIPuGQspOLmZObcIK4hYfMAJIFDuIgH+8Yt3s6yKpKM2GJJsLJh+tCpJ L9WykVjNLb/e3RhFMUAbus1KSoClMFHyI/7Y0BTPVdKM+GeCVRu3roRiiH3BRm7IpZUaDnL96 KPaY/F9NlNebThFNTjz6jdQbOFnhVPoLHLJ/CFdr+UArHkq60qm09haTbjEU8KAvR9ACo0I4f OYX5G+tSad05MHKHpEAir5f5jtsEpdVpTbrwvqgLC71s+v0HsioJ01qQ8TJszi2si7M/rhl53 UoFPt0Mh3AdKjCTkr1UjeyFFBlJ+5uhvfRWyWhYDxe69HROa0+zE2T15rdBJU2e4MNOAoetDa WhtT+8cmiVi8REu/4Ahg4Xlw5+SWYmu+g6B5q9Rb/cXq6gHkHFl/MMSUCN3i3euSUycFGleSL rBMlyeCxgxjK9B84DGa5aX+1MPPKQvqSPWkpYP0iUrauKTx/fQO8awGif1IopPrvUv5BBIhfK +Tmac9em4wxzFTHKPbnZT/GxigyRZ5S6BWdk4oUSISLyj9slsLXDv2vCFrM4JVf0JJesP1rd3 d8Fz0vF9kMlHcKOmke/Rr+s0khsCIb9baJ7lrZ05osihpvoGx8zRaVGod+Mhjv1WYydUU/yXx N/49htCxdhPkpxRyuoK7KNchUOQKbA7k3l4nZjELmt/dW3CIe+WgG13s/gfnGs37R5aJzhIem 8+bsKqaxVnRrGvdm330bX90zGmIR27LsjkB/N84v2YV+iP55Eg45dyha9blcsfVdjJBh6ZVnS /+ILjuJ/h+eWwX8CyaZ1UKqlfAE9P+rJ2/HsOUrLcTqPvWyPZpeRHogEjD/06Q6CqyZqvKqqC sbxUjxFuBeUNTbWq/T35YiewXyCAEjy6uYQdasZevoZyK90DhZPAte1z9PpEgT7RLxvlRUZtQ YSo8oz9WAl7yRDHg0sx5vi0s/ZTMZsr4L6E9II1fRylT0Q0xu1w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_224409_284230_C98C2639 
X-CRM114-Status: GOOD (  19.52  )
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

Hi Ma=C3=ADra,

Am 18.02.26 um 21:45 schrieb Ma=C3=ADra Canal:
> The bcm2835_asb_control() function uses a tight polling loop to wait
> for the ASB bridge to acknowledge a request. During intensive workloads,
> this handshake intermittently fails for V3D's master ASB on BCM2711,
> resulting in "Failed to disable ASB master for v3d" errors during
> runtime PM suspend. As a consequence, the failed power-off leaves V3D in
> a broken state, leading to bus faults or system hangs on later accesses.
>
> As the timeout is insufficient in some scenarios, increase the polling
> timeout from 1us to 5us, which is still negligible in the context of a
> power domain transition. Also, move the start timestamp to after the
> MMIO write, as the write latency is counted against the timeout,
> reducing the effective wait time for the hardware to respond.
so this bug has been discovered by this series and doesn't need to=20
backported?
I remember complete system freezes during suspend to idle causes by V3D=20
on Raspberry CM4 [1]. But I never had the time to investigate further.

Regardless, this patch is
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Thanks

[1] -=20
https://github.com/lategoodbye/linux-dev/commit/6af3f79da5b5a41b37aefa6abe=
3d368c9ef09805=20

>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   drivers/pmdomain/bcm/bcm2835-power.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm=
/bcm2835-power.c
> index 1d29addfe036348e82293693b4059e504bb25575..7b9eea10a24e26835deeca84=
c60ccb616b99a508 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct bcm2835_power =
*power, u32 reg, bool enable
>   		break;
>   	}
>  =20
> -	start =3D ktime_get_ns();
> -
>   	/* Enable the module's async AXI bridges. */
>   	if (enable) {
>   		val =3D readl(base + reg) & ~ASB_REQ_STOP;
> @@ -176,9 +174,10 @@ static int bcm2835_asb_control(struct bcm2835_power=
 *power, u32 reg, bool enable
>   	}
>   	writel(PM_PASSWORD | val, base + reg);
>  =20
> +	start =3D ktime_get_ns();
>   	while (!!(readl(base + reg) & ASB_ACK) =3D=3D enable) {
>   		cpu_relax();
> -		if (ktime_get_ns() - start >=3D 1000)
> +		if (ktime_get_ns() - start >=3D 5000)
>   			return -ETIMEDOUT;
>   	}
>  =20
>


