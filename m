Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=phTdUTpq;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=TRqapx6v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gF29lVl8HY9M/hv2wsnrcjRNlNM9ZPm3tn3+eQc+KAo=; b=phTdUTpqCxAh2B
	0tba28GzgGBZn7oZ9qu1w0LbIpLDD1yWHfbWOTSusKtq/ibzzvGmGrPoMS1vVxqvIloPD6Ez9ygzG
	gASR6+zC2aGguJlKH1tDKfQehvmm4CVVk6AKEmOUz5hjg6xpjQ8J/CTxI6WYTAvaT9U7mopD19e/j
	HcXiF3iW7YPuONQ8g4AEvoP3oe27Sb/R1iDuOqVLrHimhQ61afTkBuK/lq54xQEoKjYapyd1pBrkf
	FKKy1f3d86LywNUYo4W8sAefImtFOaQ7sJReLSbYJdYYKnsFUhGJpjD37PllyYmo2WisWtf3rPRZ+
	KTpNKaWj6tQDqePRcn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW5T-00000004f61-163A;
	Wed, 04 Nov 2026 08:11:15 +0000
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW5P-00000004f2F-2EmH;
	Wed, 04 Nov 2026 08:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793779869; bh=gF29lVl8HY9M/hv2wsnrcjRNlNM9ZPm3tn3+eQc+KAo=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=TRqapx6vmU271M8ykSTL3r7nEcjuL/Xg2+At7cL2hGRnGY9dktAXdNk3Wf/nmDw1I
	 O1vcaPWgebY8QNyzgV8ZkOLIUcjoDvM7GS30C9ufY/BuuZ699wBE5xDKDO5/CfDRHm
	 Aiu3eRK8gZTagxuJHgC7TVjfVZp7J/SlPkSXBRIk=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-XMAILINFO: OBsY42vIixr9voHNmCSGxNYclsdG6Sal1N5wgHw975+B912JHF825Qw4JPgdgT
	 BL7Ap/HQJUY9RvLbpyZBdsClTIdXYkTofIeyOoO/oXJU9HOsiq35MUo9jcpN5B3Ox/bcWYeAP0cxA
	 MjvPlhgfRX0lmezpiDc0TnHSBhNSDJLMHgLotsTlYJ8L9CHU8+AhvXLscg/RYbe8sH3hJaJwMSwBT
	 IcviMkBtmt46x1SLAkPTkauNbMXaDgj9Os2p6FqP7KAFuE+FPrz46LEzZJxiYA17CNEkeRbC8LjPW
	 KDhumM29TAY0FH5wAWYDCCPxZscshbLus7f7+DexD6IeoB5rxUZXhYUOD4yV3oMrGqhbqPkK5VWdX
	 5kiGRMWAJ2EmVYIE5mSkG3af5u9rHt2Yp9Eh9/bzkR4KlIDjjwNoMCxUiMxNbSdu5OzFEPv4eOGZs
	 m2KD0f/JvEfD3ShdfMf9uhKTj4Oymny4ScVgb3WntnFFKq3UHBK9OSEI8x544jMnm7w+1+yqHFAFU
	 oXmch/Zk29Q1oCawqXNnhzksAgDZcTuEAB3cciI6FvcI7eFtnQPHIBJEAAhwR+gCeIWqZfqHOb3RW
	 UD7AFZgp5HyimOEAYZM0XreHls4bElj0pgA+zzKO8rpGkl611FboPBa2/dE9Vd7izhlC+FYdJM9XD
	 qPsVbabYhPlOoYSH8cBjGQM+9Zk/Z8lLfHy3PMLEaXLIGUOhyf4d3q52FRxmO6/TTAM6jRShgL9SN
	 oQwcFbpAvoAedltVZAVmKuKInn5CZ6JAt3vMBF44AwDRbYjAGhP5gT1MIpy3vD5OSsxRPLC+obwkX
	 zmxLtVGR7HGSMGuiHMEuYFSMDsAOhPuRI5m0EJiy+iLtxkJX4N/nJAva76tPdE1BLjAelqsnrE4qZ
	 GxSM82Y/bejBLqqUZ1h0gDfo++eA0GaLSwBEnDDjIoOezXUNk1PceiIIEEWtX79Kal1O/FBpZMI1M
	 nyUN7PzsR1RGj/J6nHCwIVy3Nm6m38XCfVLshvi4aVqI6tSassNe0GkxGNGe7gljEl/oF1LIuuxCZ
	 SF0jQ7WFkRFOEPv714u2/VLEhTxvKak7V89p5
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?VGhpbmggTmd1eWVu?=" <Thinh.Nguyen@synopsys.com>
Cc: "=?utf-8?B?bGludXgtY2xrQHZnZXIua2VybmVsLm9yZw==?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZw==?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw==?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc=?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 23/27] usb: dwc3: Configure RK3572 PIPE port before discovery
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 4 Nov 2026 16:11:07 +0800
X-Priority: 3
Message-ID: <tencent_B554CB5826E48E2405EC22E6FAED3721D10A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <20261022-add-board-ok3572-c-v1-23-0b0fd85a31ee@qq.com>
	<auqRrz1kM-sfJEQ-@vbox>
In-Reply-To: <auqRrz1kM-sfJEQ-@vbox>
X-QQ-mid: xmsezb41-0t1793779867tvkd8y3x2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_001111_920703_B76FE886 
X-CRM114-Status: GOOD (  13.32  )
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

SGksCgo+IFRoaXMgY2FuIGp1c3QgYmU6Cj4gaWYgKGRldmljZV9wcm9wZXJ0eV9tYXRjaF9z
dHJpbmcoZGV2LCAicGh5LW5hbWVzIiwgInVzYjMtcGh5IikgPj0gMCAmJgo+ICAgICAoc3Bl
ZWQgPT0gVVNCX1NQRUVEX1VOS05PV04gfHwgc3BlZWQgPj0gVVNCX1NQRUVEX1NVUEVSKSkK
CkFncmVlZC4gVGhpcyBnbHVlLXNpZGUgY2hlY2sgd2lsbCBiZSByZW1vdmVkIHdpdGggdGhl
IGhlbHBlciB3aGVuIHRoZQpjb25maWd1cmF0aW9uIG1vdmVzIHRvIHRoZSBQSFkgZHJpdmVy
cy4KCj4gVGhpcyBsb29rcyBsaWtlIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBkb25lIGluIHRo
ZSBwaHkgZHJpdmVyLiBUaGUgb3RoZXIKPiBSb2NrY2hpcCBwbGF0Zm9ybXMgc3VjaCBhcyBS
SzM1ODggZG8gdGhpcyBpbiB0aGUgcGh5IHJpZ2h0PyBXaHkgaXQgbXVzdAo+IGJlIGhlcmU/
CgpZb3UgYXJlIHJpZ2h0LiBJIGNoZWNrZWQgdGhlIFJLMzU3MiBoYXJkd2FyZSBjYXBhYmls
aXRpZXMgYW5kIHRlc3RlZCBhClBIWS1iYXNlZCBpbXBsZW1lbnRhdGlvbiBvbiB0aGUgT0sz
NTcyLUMuIEJvdGggY29udHJvbGxlcnMgcmVwb3J0IERSRApjYXBhYmlsaXR5LCBzbyBEV0Mz
IHVzZXMgb25lIFVTQjIgYW5kIG9uZSBVU0IzIHBvcnQgcmF0aGVyIHRoYW4gdGFraW5nIHRo
ZQpob3N0LW9ubHkgcG9ydC1kaXNjb3ZlcnkgcGF0aC4gT24gVVNCMSwgVVNCMyBQSFkgaW5p
dGlhbGl6YXRpb24gaXMgc3RpbGwKY2FsbGVkIHdpdGggdGhlIFBJUEUgcG9ydCBkaXNhYmxl
ZC4gTXkgb3JpZ2luYWwgcmVhc29uIGZvciBwbGFjaW5nIHRoaXMKYmVmb3JlIERXQzMgY29y
ZSBwcm9iZSB3YXMgaW5jb3JyZWN0LgoKSSB3aWxsIGZpeCB0aGlzIGlzc3VlIGluIHYyLgoK
QmVzdCByZWdhcmRzLApDdW5oYW8gTHU=


