Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65324C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CS+Gi0WzooNXpSduprgHt/xrr1DtrJS76eULUS0BXDQ=; b=G58Z3Io5iKYxRJkjohWvghd1Wm
	WsVCiDje7ToxTqjSC3Xhl1jeQ7tsNCiASJ1VHq3isiWOk9NGY5BB6TXJKxqqqa2GZWP+M6+Y8LazU
	jnX8wtU5neDKWZCqbrhwFa5I2fYGUYt/rnIhUm4E/rO7sUqAm/uqIPrVhUQPteAUYi/r2CIaj8paL
	xev2Yi7HfV5mBriJpfUiFI3W+/4KEO5dk/QTqvdIlQG9TgwbXTURvNtc1vja2e16eDvI7vTx8f+GC
	Y5hud/61N6tJkaZtpQxV4A99oxYG+AIC5VUVLP2Fd6aHU4/6miUB5Dtp/+MJ+wEtWQOwXztaHSNkg
	98eY0sVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffH1-00000007KVY-1Ijg;
	Fri, 03 Jul 2026 14:53:47 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffGx-00000007KSp-3pxM;
	Fri, 03 Jul 2026 14:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783090414; bh=CS+Gi0WzooNXpSduprgHt/xrr1DtrJS76eULUS0BXDQ=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=RFUvHBE4N9iYueVnB+VpEFRtFe/ziWz9QNBZKs9PSqkdgFeWYniZfXlLnBcmr46Db
	 NJofz0P4wpKmvBTQvKJhqfF8UWLI0wSZXLCEL1FxsfNDivvEZ3AxzDuqokiP1TwDCB
	 Op5nGHm7nRJHg7D98g5E2g1lo235DRO3f0XaG7Ng=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-XMAILINFO: OImhmUSEbAWcT2IHWW/hjuPTBpK4RrQqRf2cBNo/s1dnpGT3F5w5IHksEzAmKP
	 6ZFzYKPMq4B8CxWmN6Uj23da3mQ7AFQqyLRF7jWMIM0F6SEmWPhxipgperIpZlGtuWCHd7xIBiwPp
	 JM8wwprDpf2Re5QKhuDnd/ay+Au+T4tKL+NcvuZrhSWXWbkqVKhff1X2Ts/LRF3T0SA3GE7juYFxS
	 9ZSHzuOLgTv5YloTkoeNB0LFvDWEUz4D1POnNUfPEjmHKKRUViR/TkpzYTgvexR3Fp8bJN9SCchf5
	 U60no2JyJCtDSW366HdHi+JwAA/1Bn4DGhixWVijxhZAcdcgZe98o+59fP0wxP765ME/xy7VkSza6
	 Xu7MXSFfxqP4JoMGkXYoVcC42Cn53vYWfojqS9cp7je2dnXwLtlMuREsPpn3eeyRBnsESGgsswhos
	 q1uAHYwqTpVjXHfFZ2YYXCnGweh5eIbwzmbg8HvW2oCsNwPuubRWrIaHerftu45klQVJ+nWpduhUF
	 /KS34Tep6B10qqgjECkPp6zWiLR1JmHYQP0cRF36Sovdzvgqfc0ChNnCb5inE9Z7s2ZtIyBfXCIzR
	 B0/Jqp/p0+cGkJpOwxb9N46KcD+1pEmCVBbe1luZJb0yVZSbg9QyIn6IkQOWyTWrDvRRXjSvETk9x
	 DM+drrBchaPXqFik96c/Eqc7erMELDBHwApMdW/Zl1Y6YSGRJdXp0bldK2HUF2boaM6TaeIVy5r9t
	 d/MrRoOIZ/XrzTGhSxcva5pihBOjHoHX0VU0F6Z22ZxvViFsPiszZXCoDGZ/QrMyKKJmb20Y72SDI
	 yyFh1c9NN41u1yMZzyq3JwvX74FGHJL3xQxRRG+4jKPlPVmWqcNNeG6vy36OPtKkDtTivJ4jXx+YB
	 hrpoBXWB1kdUZJKNLUetSs6xz7evYwIvWkhgoCEX1gyJ2iHLVqOJegRRGV3LrntBGtcoav8QOFWvh
	 dK4FNW5WGkKrSpr83gkyegxLQglNfToc4ij2eke8fC93fBsOzCHxiZodRjwfNbXdBmYcORAS/ZauM
	 bfRAR3Y3JO+2vQp0RYg1Zpz+Tcj5YHezR6TCb/jItwJgGGSk=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?UXVlbnRpbiBTY2h1bHo=?=" <quentin.schulz@cherry.de>, "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>
Cc: "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 3 Jul 2026 22:53:32 +0800
X-Priority: 3
Message-ID: <tencent_6D8030C4363FF6A6191A0C19F384BE91BE07@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20260703-master-v4-0-47d40bbf5fda@qq.com>
 <tencent_48121342466E02301067FDB89BEA68886509@qq.com>
	<8c5be502-c520-42f5-9f2b-c49c04e99f6a@cherry.de>
In-Reply-To: <8c5be502-c520-42f5-9f2b-c49c04e99f6a@cherry.de>
X-QQ-mid: xmsezb41-0t1783090412tldcxqjes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_075344_501932_3334927D 
X-CRM114-Status: GOOD (  10.11  )
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

SGkgUXVlbnRpbiwKCgo+wqA+wqBEZXNjcmliZcKgdGhlwqB0aHJlZcKgQ0FOLUZEwqBjb250
cm9sbGVyc8KgaW50ZWdyYXRlZMKgaW7CoFJLMzU4OMKgaW7CoHRoZcKgYmFzZQo+wqA+wqBT
b0PCoC5kdHNpLgo+wqA+Cj7CoD7CoEFkZMKgQ0FOMCzCoENBTjHCoGFuZMKgQ0FOMsKgbm9k
ZXPCoHdpdGjCoHRoZWlywqByZWdpc3RlcsKgcmFuZ2VzLMKgaW50ZXJydXB0cywKPsKgPsKg
Y2xvY2tzwqBhbmTCoHJlc2V0cyzCoGFuZMKga2VlcMKgdGhlbcKgZGlzYWJsZWTCoGJ5wqBk
ZWZhdWx0wqBzb8KgYm9hcmTCoERUU8KgZmlsZXMKPsKgPsKgY2FuwqBlbmFibGXCoHRoZW3C
oGFzwqBuZWVkZWQuCj4KPsKgUmV2aWV3ZWQtYnk6wqBRdWVudGluwqBTY2h1bHrCoDxxdWVu
dGluLnNjaHVsekBjaGVycnkuZGU+CgpUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIGZvciB0
aGUgUmV2aWV3ZWQtYnkgdGFnLgoKQmVzdCByZWdhcmRzLApDdW5oYW8=


