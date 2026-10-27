Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sVbmoo/w;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Bp8TzZwa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ODqdDll0GzeBcm5id2YOWtXPK8sRGU89nkrBsWu4rGg=; b=sVbmoo/w4EZ3km
	QfxOybyQuQg4b9ILfzn4zvNTia3mmmR5fapJyqRgu6NcL6XMw/HDXg0CdU4to4bqLSFtTumrHXbl1
	/VrcUL3P5OVNafyjabxxTGwnwL/IiYWQPjeFgmma/70NRCZGCtcnVSsXxez7HVm6KxSwBRO5IePgA
	chmGbDPzf+dM4HnOdM9tV7SIS036j5Jmcmn+AHweWNFKAzOSUW9SsnOWQTYzk43yDjw1MInLHIn0J
	PzJoNSqr4Ehfccl8EDH30j5U6z9IDBWrrn+x835PAeGxk22tfPkrYs2UTWQpAg0jbpokXgj5iavJ4
	iiMbRj2WmuGRIrghAnCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLecY-00000004K9j-40nl;
	Tue, 27 Oct 2026 10:41:34 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLecW-00000004K9F-1h9o;
	Tue, 27 Oct 2026 10:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793097688; bh=ODqdDll0GzeBcm5id2YOWtXPK8sRGU89nkrBsWu4rGg=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=Bp8TzZwahKLRL/SddY2Sg0Z4EgXZhFRQLTen7N4HzWrkmRHPComRS++ga8FooxmU7
	 1LC7SrAb6PmnKry6S1aQWCifa17/ZE0OKqj9XUDSzlUgOvj9SXDwvUj0NGmDURJGFl
	 f2QZM1+wE6nVmwtcj+MnabNzHNCO5Viis1uiB1sY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-XMAILINFO: M8rNKBZ4ITTu/T3HBktjzCSSpmd1v49tTIKVoHY4f8yo6KAyxeR/z8PauSRxY9
	 OdcEgVFE5C6gG8fOIhtokmXv2YwzhxMs55TK8NTw6dJih0xDXHMmwoxERaCYOdz9Vzw47IjxXZMh2
	 dOrvV4n5wLxxc5MXL3XcegqP/t0LfZ+LgW59i0fmyjDa4Yb2RX+7Pa7kO3h4GQBoQLvvnJFCjGYB0
	 wMhqhpedsNpEoVTB6XjrpHAwig+k6vh00HtpQe8FoxfLgqMEhx7ECLOyEHZ/je7cvaP8FzLGSCrGo
	 3JK2h5c3Fk/xf0riijVv/v7sG4SoXzHfLsSRdQunYLgUdiPVzLwN09HvoHS1sR8tvnD+fPrn1ql0T
	 xZ79A6xIXH6muirtZah6s0NLu/1dXFzC0q2H/sliiCqeaX/Qj3xKrnndLvWrDshBfFz23Dksm1uqb
	 UoEe0pYJSoSMpA70gV8Pvz7/PFSVpf5282wtBHXS8lR2t57XUylinUCa9bFIY6ZU5VPoOudeGZQc7
	 wnmPhKE78tVPF+4GeQ8CkswPdfdXM6+dqQz8+7BLoZ7Vyf3aWIIySSbkvTBkiGcSyL2ae/RoHI2S8
	 grDRhZQklHs/Ni+HLQFItuB36xHyVNDPaanqVKhNIuFkxNuzYBCPhdSsvYxAXTOSx725ETm/fTspt
	 4pkvfJqLQgprVQMPNWOCMgQO356hvXIOJxEsBwMLaxGjifu+Ri0Vp1PQzvBk5r8mLO9eAiAdJowV/
	 7yGSyBp/Tg6bG5CVnOA4vIBGQSYPpcoaZE8B61Z3wV2swOApepU1GWOdZPpRa23/8wF3uZyBhZ38c
	 oO1SWTT1kdNMP8x1ECfqK0qxFI3rm45L55PUzFEUtl6GWO5SZOV7ujbd/hrkek3ze63PTFZuBF2OV
	 JxUru6O5R33HUCrDYBwF5RqU+PSCyrpKbXOCXl0towbPCgPmlByb1V8gCnOUCr2mZZ5WInPYj1QFX
	 rd9rqO8Pai4DufxU4w/hJub20OUgW3On7WrGGOg2AvAmcM6T7ElJ7vuElf0GL3TGRxG26HnYI/ZY+
	 zwuS/0pcmQlnFtLy0uL3tK0vAG2EEZSI41+QmyWBXVc73WHlLBpr2wZEfuo1Xb09ZDaMvnJRG80Vx
	 +Q4jOtACtzfNwPcY81qg8sQmOMKFogaCKAgGMiY5MpRm5w0rt7w+U6/9wYbj7CvBQmhmBwDZvDZHp
	 USNbgmXMoQd
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?U2hhd24gTGlu?=" <shawn.lin@rock-chips.com>, "=?utf-8?B?U3RlcGhlbiBCb3lk?=" <sboyd@kernel.org>, "=?utf-8?B?QnJpYW4gTWFzbmV5?=" <bmasney+clk@redhat.com>, "=?utf-8?B?SmVyb21lIEJydW5ldA==?=" <jbrunet+clk@baylibre.com>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?UGhpbGlwcCBaYWJlbA==?=" <p.zabel@pengutronix.de>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?UmljaGFyZCBDb2NocmFu?=" <richardcochran@gmail.com>
Cc: "=?utf-8?B?c2hhd24ubGlu?=" <shawn.lin@rock-chips.com>, "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] clk: rockchip: Add internal support for 24-bit fractional dividers
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Tue, 27 Oct 2026 18:41:25 +0800
X-Priority: 3
Message-ID: <tencent_AE0E51DA2FACC999E65D6631016044234005@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com>
 <20261027-add-board-ok3572-c-clk-v4-2-d4152b4fedaa@qq.com>
	<f9068153-0d6c-471f-a08b-41cff51ff748@rock-chips.com>
In-Reply-To: <f9068153-0d6c-471f-a08b-41cff51ff748@rock-chips.com>
X-QQ-mid: xmsezb41-0t1793097685t5ro03ncb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_034132_771406_F3B74C51 
X-CRM114-Status: GOOD (  11.34  )
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

SGkgU2hhd24sCgo+IEkgZ3Vlc3MgeW91IGFyZSBkZXNjcmliaW5nIHdoYXQgeW91IGNoYW5n
ZWQgYWdhaW5zdCB0aGUKPiBvcmlnaW5hbCBwYXRjaCBmcm9tIEVsYWluZS4gQnV0IHRoaXMg
aXMgbm90IGhvdyBpdCB3b3Jrcy4KCkknbSB2ZXJ5IHNvcnJ5IGZvciB0aGUgbWlzdGFrZS4g
QWZ0ZXIgY2FyZWZ1bGx5IHJldmlld2luZyB0aGUgZ3VpZGVsaW5lcywKSSB1bmRlcnN0YW5k
IHRoYXQgbXkgbm90ZXMgYWJvdXQgY2hhbmdlcyB0byBFbGFpbmUncyBvcmlnaW5hbCBwYXRj
aCBzaG91bGQKaGF2ZSBiZWVuIGVuY2xvc2VkIGluIHNxdWFyZSBicmFja2V0cyBbXS4gSSB3
aWxsIGtlZXAgb25seSB0aGUgc2lnbmlmaWNhbnQKY2hhbmdlcyBpbiB0aG9zZSBub3RlcyBh
bmQgcGxhY2UgdGhlbSB3aXRoaW4gc3F1YXJlIGJyYWNrZXRzLgoKVGhhbmsgeW91IGFnYWlu
IGZvciBwb2ludGluZyBvdXQgbXkgbWlzdGFrZS4gVGhpcyByZW1pbmRzIG1lIHRoYXQgSSBz
dGlsbApoYXZlIG11Y2ggdG8gbGVhcm4uCgpCZXN0IHJlZ2FyZHMsCkN1bmhhbyBMdQoKcHct
Ym90OiBjcg==


