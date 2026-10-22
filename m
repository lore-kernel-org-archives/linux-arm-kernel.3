Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A3D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zyCazGAc;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=iCea2MQt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7zxgzzTYI172zwYyaCUL/lcmGtqRhZjbLJauuKN8eM=; b=zyCazGAc1eJXcJFegCaSnUs7SK
	0CkwEOw1FImBdpWm37VPr9fjZ/Tmb8xM9llBD5dgbVEK+DakmtuxzCBwhjZ4cdBDG7UCowLTgLB/K
	j9Rer4NxNeTd2/XMZ+dTNAlAfyII1JqaWtn9acEKZ1h5/Fammc18I9n6xaDMOiYcsbMPvhr2GipRk
	fl3UEahAp4hQYizkfTJcB7ZrdrcYs3ffYHkRVTbfLv7OG7Ah8ATJr5HRQH87jxjmiZ8rFGU+elOOC
	bsooQE+oOYwCTAa54s+wFU3Pa0qR/L+6kQPiaHvSHOboUr6gyR3GtTnnZTVcRwCMnamofpc5jE8/o
	7QIUjCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJltl-0000000DRUM-0WFs;
	Thu, 22 Oct 2026 06:03:33 +0000
Received: from out203-205-221-233.mail.qq.com ([203.205.221.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlth-0000000DRTL-1TYq;
	Thu, 22 Oct 2026 06:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792649004; bh=P7zxgzzTYI172zwYyaCUL/lcmGtqRhZjbLJauuKN8eM=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=iCea2MQtZFsBRko5lmT234iGtA8hnpAaMIAIMC9xxhHSYsKLv/dyorPMsRnk8tOz3
	 +YqFVQeHFESL7IhfzGpYEBaBcXZq35Lcq8o1hdjvoQ3muhfPIDB3TfzPTO1oH7okDk
	 zCKuGfDMCmy2cPvRSdZRC3m9/BhG2PXeckJ1PBB8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-XMAILINFO: NNWesLkrH+Yr/HKZIoi0WG9ez0k2A56Ft9TfkyVosLzXtqN3ayo1wQKS32Od7J
	 rsntzRg61vrbIc0ur6zvUNfs5Z0Re/GHeEv4ABijBGztu7S4IhbA2O+W1V7isKOEZVyEFsz5k3dDi
	 Fw96qK5EVfIwuEDJFdThOYDlYsVIXiS/39W2CSw+JjCJAlOop4GuZtBTTjddg3ezS9o/f5jA8aHs+
	 XQdSfw0ncmKJuOpqTPa7o5RWNdr/SDH3/P/I3NNkriRZdoda4WF/wVqhkP8aVExTwMK6cAc6yb93+
	 uTFozLSsJUDtFFKy6kcpcdfD/ibIoASJAdvZOoGAA9dcCJcBjI5SX7tf+7jbYjS0rOJ8P1Sl6rHaj
	 tnNhsguhs8jmuI+950uv9/ZPhoAiUQWdmIZIID6UF+NxV7+BwQwOUFfyCitiGG3LiLyw0Zo+2mbTN
	 6qWZpMFBBE2DBqHF2hu8v0voOhTRovfiFW7P6pttu60Yum6oKPbGqROsXD+tcNl1iAVb5tLvZxcGm
	 IRGGWv3+znRwYSFxMJT65PqDcaB8fGJVFl82H/BQnybDL2SvB38hjs6FB9zh/EjZH7xjnCFvvvBsg
	 qzdHXanXjUGfqhte38SjEugNz/onLzs0c2/QUSELOnonEtlQusHT1ODInD1sGno5jj8yFMfnswkpt
	 GPJ7GVycb7ZJ7nyjFqpBYDrBXDwEYC3qXastmifzSA2fYA6WEKMCk/YLkvI9nVknBf03OHpLGo+Qy
	 by6MY9w2tvMlbvBJwj2+DAqyiJBQQ+PIkt7pM9vVeeP+vltmP8R+wCl2WgEqGq7i85hQhj8TL6Gyy
	 4WTFw/ScLocaTGF1qQUcgr5m4UyLE+aV8IxB/rqKVeI69+yWx6UdxbE2giq6P1bBxZ6VI84YPGc6s
	 5K0O3yZbd4Bhj7lzdB8/OaqtO3323krcv0Ot5FPMRAXQSuxTvVlWbQBftvYNiwND9nw6vVSugWvlP
	 v4ekI+BK/6J1KNAhJrwn8jeBPTt/Ky1cwMsQlXt57y15zysSbK4UjFP3/6/ycTYqBVYa35JsdueXt
	 +ha4B7IrhED883s22djs80FgGg4BPFwN6TOaw
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?QW5kcmV3IEx1bm4=?=" <andrew@lunn.ch>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bWZk?=" <mfd@lists.linux.dev>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?bGludXgtcG0=?=" <linux-pm@vger.kernel.org>, "=?utf-8?B?bGludXgtaTJj?=" <linux-i2c@vger.kernel.org>, "=?utf-8?B?bGludXgtc2VyaWFs?=" <linux-serial@vger.kernel.org>, "=?utf-8?B?bGludXgtbW1j?=" <linux-mmc@vger.kernel.org>, "=?utf-8?B?bGludXgtc3RtMzI=?=" <linux-stm32@st-md-mailman.stormreply.com>, 
	"=?utf-8?B?bGludXgtcGh5?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 14/27] dt-bindings: net: rockchip-dwmac: Add RK3572
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 22 Oct 2026 14:03:22 +0800
X-Priority: 3
Message-ID: <tencent_5D642036FAE534DDD2B8C81424688CEC060A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <20261022-add-board-ok3572-c-v1-14-0b0fd85a31ee@qq.com>
	<09c223e6-6872-4bb6-a915-870c3ee614cb@lunn.ch>
In-Reply-To: <09c223e6-6872-4bb6-a915-870c3ee614cb@lunn.ch>
X-QQ-mid: xmsezb41-0t1792649002tmzzbeu1c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_230329_721335_7CB79CBE 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW5kcmV3LAoKPiBTaW5jZSB0aGlzIGlzIGEgbmV3IGRldmljZSwgcGxlYXNlIGRvbid0
IGFsbG93IHR4X2RlbGF5IGFuZCByeF9kZWxheSwKPiB3aGljaCBzaG91bGQgYmUgY29uc2lk
ZXJlZCBkZXByZWNhdGVkLCByZXBsYWNlZCBieQo+IHJ4LWludGVybmFsLWRlbGF5LXBzIGFu
ZCB0eC1pbnRlcm5hbC1kZWxheS1wcy4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBJIHJh
biBhIG1hdHJpeCB0ZXN0IGFuZCBmb3VuZCB0aGF0IHJnbWlpLWlkIGhhZApsb3dlciBwYWNr
ZXQgbG9zcy4gRm9yIHYyLCBJJ2xsIHVzZSByZ21paS1pZCB3aXRob3V0IHRoZSBkZWxheSBw
cm9wZXJ0aWVzLgoKQmVzdCByZWdhcmRzLApDdW5oYW8KCg==


