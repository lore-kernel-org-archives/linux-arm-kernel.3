Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c9qDWm0l;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=x185AFOg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hmJvxGzuixcFNAAocvFhqKaJGcR68LALuIVt4D8IqKg=; b=c9qDWm0lJqhbDw
	l7S1K6V1Kt/KD1MIS2CfLdjfwJ+erJM2YVEvw5f8H7rxe3Dt+yKodzo4G2eLSnXqb7wWkFAmE/zMR
	6rYG17LUUlJcOuT8fSSMmkplHTLYvA5MUfoSNtL2psH0puPIhef7OKxvl0yulg570MclNi89bdqgH
	82gzqiOZmvA6Yf4PQNltPaPqj88u0X4uqnVAsZmR0J+OHiODd9RqSutFjkds5pTsVycJVkqf412o/
	BgyzbZW51klMrgEBIwByi7DaC8g7m/83VkZ2mLuSyV4gaBfqIoeIMiDaLvvqfibPxhx4N/1WCkwML
	GlZ9RS1ZSMP7ADZDgBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLf18-00000004ORm-0nqJ;
	Tue, 27 Oct 2026 11:06:58 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLf15-00000004OQd-2f8G;
	Tue, 27 Oct 2026 11:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793099211; bh=hmJvxGzuixcFNAAocvFhqKaJGcR68LALuIVt4D8IqKg=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=x185AFOgLVk4JHvZFHvy8FZwv0CQUucEB882GK+C24yqkWX+w2DQcN25mq2UEdU96
	 YT3emcoro0o7Qm+7NFr0IRyyXFhvhqyRXh58kdF6KmJfmcbFFCriW7V6iVZg5AEwcu
	 BzYRnyOAtqXApW6GSKc2iQRnBYC7lrW2CNAKrwyo=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-XMAILINFO: MOQpAxjIVJukshyDFOyjGDwxM9qZ/D5/ZWdLzyeokj2TF2nZH64jReURN66KiX
	 GZdL6fzf4n2uKIIMES66/CQUCm/Vge6LG52O2pwGbWdi3oo9eoUfRRrYiNy9GkIyv/qBi5X9aPifv
	 z74SDVZfNbGdcwih0OHQjYqATMgIcnZGRMPxxYZBLMspsXxp1RIBcorKaAhpNCbZ3nGce9FY3wPtl
	 6cqBybnBDBv2WwgpVM9xClgBkZh4NIvwmKrwo08k6fKiOem5kp5HTWmmjTh5Jsv2CeX/8TaN/w4vC
	 c4rA/3DpBQ40Qm4dQ0KokZRM8KgF8Ww1n6oRfa2m88IdQH4weycRobUiuDDrwqCELLZ4N52rNM5jS
	 l0NxInpaHBFppvxWSxmIrzi9vr5gXWjRQIJsevhf82JTNy3H7zUwYJcG3/t/BlkflT84+N8Bi0Cop
	 YL7DkdKomHl0wfRnbkGryLWNz5T2YvctKW6lcvirgFBIKKgASyR7uRlFvV3yQhSn33v0QL2T9KuXU
	 FOXxQoB9fSxFUl7EdAmrXX3U3ZSF4H+RosD7p4mX4VrP/MUe+PZZh//OiLd494xt/rwYAV+hB2Lt0
	 K8byXUdj8RmluG3nCBhuXHWgYNbdA7PI8nWjZrlZA2Xnxezdy7rNLF1jWY8rniW/SOhcEO2LZ0oIZ
	 SlC2bha4NHHYUj4yMK7ofvx9V0UVGQi3hQS3vLM83y+EXFjtcflPa3qCTWn/V8498Olmoi8n8typ6
	 H+q7pyyglpnFTerh40LY2P84BocW0VZXaTF6BSxtrUn3b5LtICHxs3NWJgkSMrqxDX/kZoldTSsP3
	 0z0TReq+vr7ssmrpKAbOElw2sAi+zMVzCq5DYp1Kxzuvxm4KHFp+jt/tr+SVAE4oQQtgr0Ol8X8gO
	 wqaw4jbIy6/TuWQenoT7XVqB5dN9ZwrpenUDrWReCpWhdexGrfLW0mzIy5Ope8Qhf8QOg83bvxRpz
	 o4SY4dyalbGKXZjugU+n8nnU+Xho7XiHBwxVtLxRWh+qQ/NjWHOp2VqdzKnpjQCK0rqItVxdJISIO
	 pzn2FcWTqPmz+tVybVZO0NELUQHhTW8iG8ZK7YSJMkhvyHwkX2vBgXup1jwP+iPgwZ+Db
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?SGVpa28gU3TDvGJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk@kernel.org>
Cc: "=?utf-8?B?U3RlcGhlbiBCb3lk?=" <sboyd@kernel.org>, "=?utf-8?B?QnJpYW4gTWFzbmV5?=" <bmasney+clk@redhat.com>, "=?utf-8?B?SmVyb21lIEJydW5ldA==?=" <jbrunet+clk@baylibre.com>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?UGhpbGlwcCBaYWJlbA==?=" <p.zabel@pengutronix.de>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?UmljaGFyZCBDb2NocmFu?=" <richardcochran@gmail.com>, "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, 
	"=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: rockchip: Add RK3572 CRU
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Tue, 27 Oct 2026 19:06:49 +0800
X-Priority: 3
Message-ID: <tencent_C11F61130B4D904C5A82CE0849002F22B806@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261026-add-board-ok3572-c-clk-v3-0-dbabfa39d692@qq.com>
 <20261026-add-board-ok3572-c-clk-v3-1-dbabfa39d692@qq.com>
 <20261027-vagabond-gabby-caracara-4edabe@quoll>
	<3011736.yaVYbkx8dN@diego>
In-Reply-To: <3011736.yaVYbkx8dN@diego>
X-QQ-mid: xmsezb41-0t1793099209tc2h45k0e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_040655_989009_BC9BE1CB 
X-CRM114-Status: GOOD (  11.96  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSGVpa28sCgo+IFdpdGjCoGNvZGXCoG9yaWdpbmF0aW5nwqBpbsKgdGhlwqB2ZW5kb3LC
oGtlcm5lbCzCoGl0wqBpc8KgbmljZcKgdG/CoGtub3fCoHdoYXTCoGNoYW5nZWQsCj4gYnV0
wqBJwqBndWVzc8KgdGhlcmXCoGlzwqBhwqB0cmFkZW9mZsKgYmV0d2VlbsKgYnJldml0ecKg
YW5kwqBtb3JlwqBkZXRhaWxzLgo+Cj4gScKgZ3Vlc3PCoHRoaXPCoGNvdWxkwqBiZcKgc2hv
cnRlZMKgdG/CoHNvbWV0aGluZ8KgbGVzc8KgdmVyYm9zZSzCoGxpa2UKPgo+ICsrKysrKysr
KysrKysKPiBTaWduZWQtb2ZmLWJ5OsKgRWxhaW5lwqBaaGFuZ8KgPHpoYW5ncWluZ0Byb2Nr
LWNoaXBzLmNvbT4KPiBbYWRhcHRlZMKgdG/CoG1haW5saW5lwqByb2NrY2hpcMKgY2xvY2vC
oGFuZMKgcmVzZXTCoGhhbmRsaW5nwqAoeGluMjRtwqBpbnB1dCwKPiAgwqBkb24ndMKgaW50
cm9kdWNlwqBDTEtfTlJfQ0xLUyzCoGV0Y8KgXQo+IFNpZ25lZC1vZmYtYnk6wqBDdW5oYW/C
oEx1wqA8MTU3OTU2NzU0MEBxcS5jb20+Cj4gKysrKysrKysrKysrKwoKU29ycnkgYWdhaW7i
gJRJIGp1c3QgcmVyZWFkIHlvdXIgZWFybGllciBjb3JyZWN0aW9uIGFuZCByZWFsaXplZCBJ
J2QKc3RpbGwgbWlzc2VkIHRoZSBzcXVhcmUgYnJhY2tldHMgW10uCgpJJ2xsIGFkZCB0aGF0
IHRvIG15IG93biBwcm9tcHQgKGZvciBteXNlbGYpIHNvIGl0IHN0YXlzIHdpdGggbWUgYWNy
b3NzCnNlc3Npb25zIDpECgpCZXN0IHJlZ2FyZHMsCkN1bmhhbyBMdQo=


