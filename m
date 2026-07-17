Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758DDC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrM14RFwhG7BLcllm1/sxuh8c/YWTNBQ1J6TGekqWlU=; b=i3+jW3mXRjwPrDvCIBZ6h7qVGD
	Cuy1CpCIQVscY62MNTx3meNKy/TbDJnjP8vDUCehkyhpeewsQpuQjOwuvhkQwQNaa5NWHn4Aptesf
	UlL+U8qr92igA9CjiL86ed4gimMdWFLLMEEXyPYlija+Xb+53xQF82qeAVjJY1vkchFjwzOVo5Ioc
	19g6s3kd3wqqR0w6zTp6MgKUkK17AGoXWZIyO7r4GCk/15BE2ie8i1baqqBb8ER9xFYV2zqQYYigK
	AuE+Qvp/YZux6GI9KblGRRhBmFNyrkzSV2j0xkLxJbtqL+J2FCln7VV33JG+Jc6a4ZRODzwqJWKnJ
	Y2w7t/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmpU-00000002vyD-3Wuq;
	Fri, 17 Jul 2026 17:58:32 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmpR-00000002vxS-1Fhj;
	Fri, 17 Jul 2026 17:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1784311098; x=1784915898; i=wahrenst@gmx.net;
	bh=KrM14RFwhG7BLcllm1/sxuh8c/YWTNBQ1J6TGekqWlU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UPm9MJ2ryA99vNy9BVJi5G6Pi5x182BxNLUZOtvNEotDdYoEzOYL4TD3gW9nSp+4
	 x7bvaJPnM4SyLBoCTAD5lKxfvEbwn03zylWdciXeCTcDA02Mi9NlMUD7aC1PlTCL7
	 WyvwKcsNe71ipPxwcgk6Hb++82HTzDYg+HDfNb4107FrvzhsFZVEkLXVW4pLgxvG/
	 O21Ia3wlJLE7DVLNEZnUiGJAMiLrSiFJfnyWvKtWBpQTQcFffvc6R6EopmHKMXZfQ
	 yVXD0BCUlnkJ0Xq8/3N31p/uv+hfyOqjMTHfgGtKU4cvyvSilvAMZJ1nZG1OuDE4b
	 BSMjdSSAzj0qxmsf7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH9Y-1xJ0eE1tue-00fw08; Fri, 17
 Jul 2026 19:58:18 +0200
Message-ID: <4514df74-df41-4d8f-8976-242612cccf2e@gmx.net>
Date: Fri, 17 Jul 2026 19:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] platform/raspberrypi: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>, Kees Cook <kees@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260717112103.213017-1-panchuang@vivo.com>
 <20260717112103.213017-7-panchuang@vivo.com>
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
In-Reply-To: <20260717112103.213017-7-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jg5eOblIp3PqfTt3UVhFa556pX+w74saB6H2X4Fucd8w7L3ZXE+
 dtCfQxv7YxxSL7sG7DSHMMVc8EMoAmq7bBf9VfzjdBBCHPAtJmJh15MPLQ9XfzAw0ktYdx3
 rr3I7GEY9Wd9pgEIghfkzdJX+CEtGacuoqSYwNDAWI2TWN9UcxP460VQALhKvVU1TG939Hx
 FZMXy/aN8eABrYK5zhe4A==
UI-OutboundReport: notjunk:1;M01:P0:dH1y8o4z26k=;E17XZ9N0PzAKYLRe8fxfPPGlkI7 65RP1nutlq3BaFlO3eYgI5JAhc0wnEaIBrUuXxE9eSCmWZ8MT4PBPyMMxPRdg1hfy6HGX7RDR TteDKv5XSkg+Ywjp7d1UiPmI/+Mp+RLCG0nEgZD/8+ISwKq1+URTNXQPg80fPawcxQjw9zNEg 9Zxq7MPOx3GdRGcoyiJaoyxZm9IgJJzHm023iKC22dQvR82ZAIGL5ySH2ku/tZUeuvgbADpOI TsJ8rcYEfwaVrZIvc7JkwPqjriwJTNvIRuBFa94Q3TqkpScYZHlmrzSvIoG+jJFCy2M5HuPqw ciluuYQZQQe785GNDZim1PLb2rzYW3xRZbUMiHrpkYV0coW5tr9GYd3UQvNjCN0Qf8+/n6G7L yf1N0Cv3WOFdEeFJSZpdCaB8qm6hzvg2VlOAxhRNCLf1q0RML2J4YmRe3vvbCMm6/PU6e4DVX dYa8yhDhLXhicerk7eKLfWfMg8YH1csRimC8wG7z+tjqxVLkqI+I4r3tVUqyDnaIezEMSdLF8 GtRFY04Xp2D0I8G4kpL9EDick9/U0NgBRl8QPwNw6xJ8cCXJoUyu4v+p+TsaZGUBUYeWjnNHN F4d+vqTwo3lotQzlQwvrZD1vM2DsK2ltSLe6tjRnQmalFBZL/c0TrI4xYopm7oa/SLjh6bWOK 60Xb+QQZwp7P4q1Gye8vOsLGJYs/P7X6XZ8tpF5euliqT9E9F6vTkMlINKeb4hLdWyKpFXRyB s/xTQnRMSCyLY9IdqDrxr0P5mO1zYXfKUKYVtKhXFfVTAw38IIsWmKPNmJItn/EDuxsygx0sJ ujQWZDekJMQBhAeqLJhb0Ul87uaw/rZy/qXOBVWpsQMM4lN+xrGmV0XinyTbRDi0X/tXmGTdt 5p0/6YE+WNevF7MEDZaOls2LVxJ6LYl3DyXyl3LROOC7I9uvGyQweTTYMgH8aKv752b0eC0tb 9pqQoGNq2Fm4orOXBArc/yVp2iUiBN4kfNhCzCgdiO84JLN8g7NbWBzWHT9Yk6nf4TJTpyoB2 fXftPhYtm2AHcHe+WoKQ0Wbxd2acD9fFUG6iUStPWDXm7j1A6zb03vWYgXcoYW25dDDXALERl MSDFOXpqTOkkQEx0MqwvTRiAIlCmW2FbbDhHd5kuS8AnexZ7N/ptk0FoaaK36RD1eZeIRR3Jq bpH3BBEdNvlTxbCMxaUh5M9RdkPNY3TASwQ+Fdrv+VeT1v49MOZR2Udw9dbgB5Bv4b69Ik6nt vh8G1PUuZy3Sa6GbjsIagheiaLWS0cNEvVQQGelyfqeZ8pPBFWbULYeIuunX6i3OgN5dFtL2Q hE4jF6X1dO3Yq7Fcn7iIglF17vzvpgyHU2hL0ROaKXYxwinJ9wd/ZeayKctDoekmQXiRPfoIK 3TYjNc5Nqp/G2Xz1sLBB+TCewADdyTLndj8wmN2UXxL3VM+dr+O4ZcyGDRXmrU22GZGdrc04n SqXXiOp7usBVMgEVq9+QxOfo81lxq32HmsVwT+b1BlYJqGH3mjouU/1VwCBf8gzFGKihLH4wz f3lH3GUzIbOIa48LovS+SQk0nvwD5W+VVvR4k41jfenwri/FwDgMubMaWFvTSsvHVSg+JSHCv jJwwogC/1hAIoJd+xiqewAoeHMvRtgXRQqnj7p+JnaeWDRFj/y5SyVOHgWmitJkG0Vv+KIpgr 47Uxc/Dgd690/GdWlFlOoa13rLxN8Zu0zPMJbDNvcRiMVkb2ai6QhID0HDGBheo/oqzwS2d21 /ZYRao7jKYclXu0soz/7kjj+1t4acGEQ2k1608HWY/K5tXTreqSpT7emOB6sfgR+n2yVwqb/v visyvjM4Eunv96AF5xUVJX0e1y3JqL9Mxpr6WDAnCrBqUgE9EQerzheGxCfcAmljCdARH3E/j rCNM/ycvYpMTMKaueFjkvFPxe8xWI4bLbYO3SL65dkgYbcl15sR4CVldvFr2Ml2XtQufUlDSc k8NCuUGz3buhltXzBuaPSnmeWnBjd0OGL1zeWEBiZG8Kb1A1SA3fYiTbSk4JJs5TN/7kEbdhs 7r2tbD6N1Ib017F9SUx9F88xpfQEtZtKgt+DH7egdooeRS+BvSXV9cuXlY79WkAQUMLEj6fra XVDaRWtBwwxQxfzH5qTxqRO6FRclEmdl4gJoslD+Yjy6mIXpxWrOyifsB77zEkQK9Mky1SNGV hEaAGzKpKEwbSJ6SAzAKWf4qg2FHeq4JGHgnhUcoizMJIG8kzhcL/+7wyNjNJIJxa0jxV5fHX IRy4LowVAWjf5KsQ6nNgwHHvtFbSxCtSQ1vlV/w9A0e6kBx9X0TgDg/ZJjqkH0aMz/kvSNkKS i8DSsidJ1+yend1a7t0hBaMkvF865Gq3WH1T/n4J6PAj2QUQFXw+ATJZ8lrCYFPyTPjLGOUaV YuNJkfa+g5G/rRam3WmPmmn1c2+CYG3U071pBiacLzgfMpLL8e9P4nHeB8exvIa4KgS9bLLQN qTWf4d9DomS5xIr0xCNJ3Ni+rJivSsJNxQkkzj/MRD4H1qknA2X6LRRsDn9u+1/GPyrkYDFrw MokwNbCs7ge4MEnSq//a7X+3edLtgTm9j+BlSnmBYtvbFPQjfrQ/ShLAfd1MkMTmKYk7UR5A2 l2SZ1EdXNbDADL7U3MYIfvGbrvcU3uFi5f2pFLAcJi4Yn+I52guK4vdbVE7srlRiTgj7S6loe 4oC4pxEC/qc78TQpagIHp0qYoaUsoS6m9tZX//FS+iKErHyJJLxFoYr1CXoeoMxjvaoL2NYES LHr459Ef6PAVR4HiU1IGl6UWoMUCTTTOfKjsmQAc4siPSVEq2P2X5Hed2tmQR14toYXvpni+7 cSXrvg/IyLeWCM5HxvoFEMIfJnH9FsVmLm9FRQhRMJStlGgTeNd20ENX0BKR6218XDvUrjuph FI1rWBnS4fsEORdjj/ffUJnv/yAk+yF4OKVGgvmi4LmYm9HyKyPTfKjxPwVIucdxbgYUU2l86 YLZnUjVlWb8TRwM9mMKLzOQ2qk7bYR5XdaiwC4aLCVq0Qo4mmVyHpBOkf5+/X0L43BIVYMUWb te6Jq50UAvElJ+ZHadsc8h/n5Y+FfoPCqHcywty3KwjabBs20TkAS3rhE0pYzAS/kJ6GLpCfK RRFWjhy+HP0baky6Bvsna7Oq+rqh6vPduxFzDT+eDYigSFOuOo3DkfwtviNKiEolT51vzW9vd vyBO4wrqZAth+2tRc76lPoyl8wbkzbcgE/3u00UvgRC/tz63BbcaJHxJcsMqr8qk7idoxshro O+8+iMqLX3MOdbXQb13bKFIMU9RGQMv7ReOPPhoQ+Voqod3FKmH50jcPeIXQrabu5T5UC4/rn fVhiPZapCWDg44w8P/VgTLYPM4eC7epAnRk5E4Qxq37q2sDLIh2LNHfTKn6V6UjVeHK/wGmuw hu/IqrvjCfbkBSsaD1nziwFe74Kd5Sf8XwDs4UdXDiB+SjvuYhhgg1mI9ir6/W32LsHNlR5NZ +4an4mMk/zy/9qi2ccVX45mrEUqZtrnGFxFhwxMnfeJxAsPAqfewbEGN6LeNXmT86eu2qW4Pb zcC3a3kNYV/Wq2tSh/HGwqAc5YhnFZIgQbugxbJBApOmibFAuYE75/KOVKF4gY1rA77gR068Y LcSURdmfvq2f45oJbjsQNz0dq3+erJIgrxQTzmQBfMws7zEoLu5OMxgugjFVO0kzbwd0j8mbi +vurrP+SK9bGTpsXUXeVtwHr0xRa3e1LeEdadfNRy5Ay+To2WzbkDSux1TPwcfX69oufRS+e4 NgUfQHbAd1ZB7x7GpSx8ZDbg7feufocaf41khFcVaKNsu7WCNrjPniV5bb8y36Jx9dm20OqgL OlLdXzMqnZJZCSgQJOhJnp7wx9p7uG/fJqCs8psL5qJMBMP8aF6x8ekznpoCvLF59rKsSojdD
 wnnLZeWZL7L4MO8kwUputfOz3QQan09pAtaCWv6KM28LEi19ukFnhuo3KcwIAaGUzbwqd/u/G vKM3ANpZ7NYxjlG+mAMWUITuf0pu4Yl7zMBNAneozWyhTJ1HRkwNSSR4GELzU8XPVr+3uSthM vYwjAv8RfszNyTcbvtrQSZlhSpvsqtLIep44pzwWUXG9IRHlkxove3GNOCUVS2pB0HBgpznny E1YOl6Z92+ZHqo5zKUO5wDFLy2HaM5QjlpTpbQMczFZqxvb8WkSGyjpAK2JWSiX/oce1hLzrj nfRWWNkf2ei51+WbCu6e4MpWo4Mut94w8JINXxF6oas8ak78GwTPE7EtlprJE0wR36C2zaZw2 i+pKsa4dWYdPDvl8JArrCKgTU+RDVUOkQg2P2SJ8PbJb6oxJ88UbDfx/AQPG4JucdGXnfVOOY 1FLemIrq0Jeg7hWWhF10R4TtHdECkOZIMBjHR/AapbXAVz42wCXiBzHrLViHEi8pqOE1y+Xex ZlbHHM+jwyTKgBXuGWTJmTR5B/fVMJOonAvkpfhSVOs8ADKkzuVdsIVnYHXp0XCbFDKFYrVh7 mAldHKl+CF9ra6imi8FaU8iTmakM4koqcNzsUC9ntHBsJOFrIyZA4vNAZ0Ru4KkavAl6kWR0E xfE8JtXgmNqyAX4S0iWoEP2xDPo6VPa9NzgUNs21XHqXPlt845Ki1dcY30pal+Kzh98wXTh+x m8NIcQwDu/emjdr9D/Hv/FDq/+aXViA74Z4qXPAU7FEC8vIOKRy0y77lmkpSViekXmSpQfYoY /63/F6OOkJ3X6s87EreGD8SeNmj2cP5vrtjjLucdlXpmrDVFBIy0/2oVYhEwXryNKjCTKOZEE M12YcbN9atWfhLMZfLMKkSAW3GayG2t5r4/Pzka+43Sqef2TF4vqZpjGFSjpyg37LF42r5Bi3 EYks1hfCy/tE5hzoINBmqfCBAVTQldNCrlEDzuY4bYliHNaskymWj3LBntjcggWUdels36R45 K6lB4cYW4DQ1h064SlZwccbjYwtnK0Q+R1NuHWIhGJpw4w858f60Z006vzRoO/lauW8OYaYwg 4c6jiT7jh6lA6+q09s81epTudN3SYoSy2wjUa6WOJibJyVVYLObueGvbltPfsyPd5NoF8oI+/ Uq6KG6NPtum6mi/A+qXrmJVlNJXllimOpAkRPBxsT7brZQIgGm0QuWYMW+YCK3UyA7Uu6w2oT TVzYjVDj6tEnXFrUYRQZEDusOjsZ3uRzoniI15UoyU8Zd7WVVrXIkNjOz0DKke3FIxN8FtN04 EXaq4jUG7YDXgCpiIiEBv8ao0RX03unZj5srJUp3I7LvGPDBQ09bFcz7kkSyXWS6XCHE4KTQa F2UrZfr3MJDTxmffWGxGkr3QICcVLs36eMtsjFAFbKDVAJxZ0VIOqFIslbEYn8aivWr53LMp5 +42dhWtOvYZYbMxZXkXQn1xqmhFqchvSBEDhOMrjlZq6Us40v9FBxA1XW+1IbIrmo1W29aZ+b 1se/o3Nibj3fxwSFMh8ztEhq+EV/qf2dCMPK2WGau/zge2mWpJ5rTQFSC0KZC4mMEBLmFFVhv wN8tP+kyVrz/p379XM6dnvl9mwVvIaU4UmZJ2U+IybpxABN5RdTptH9m/gryFe3oAHaJaHsrW 6UVoE7FjKVZ2YfA/tYCkiuWGDGwyVObF32Ltv8LWlsE9cWymz+NE74gPAviA5Vli/XMGVCpi6 9Bxj7Ucq51//Egp2ARtMl7HSdIvOI1ZGRd0bsVpnWPBu70MTfpSsABruVeRZEZuIG0QEnX/xE CNEfschhc5nplcciO4AmSMUA/1205HwHRK/OrVI81HKjPQ9QIoZK7CsQomcWUe2VFvcpTEzcg mMawIV8Q6p+mQqCcKJOPHOYuFXYZ6510l1n2Swkl4dg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_105829_714569_9CA448F6 
X-CRM114-Status: GOOD (  11.98  )
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

Am 17.07.26 um 13:20 schrieb Pan Chuang:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/=
drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> index e78641703252..9490ad88df0f 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> @@ -257,10 +257,8 @@ static int vchiq_platform_init(struct platform_devi=
ce *pdev, struct vchiq_state
>  =20
>   	err =3D devm_request_irq(dev, irq, vchiq_doorbell_irq, IRQF_IRQPOLL,
>   			       "VCHIQ doorbell", state);
> -	if (err) {
> -		dev_err(dev, "failed to register irq=3D%d\n", irq);
> +	if (err)
>   		return err;
> -	}
>  =20
>   	/* Send the base address of the slots to VideoCore */
>   	channelbase =3D slot_phys;


