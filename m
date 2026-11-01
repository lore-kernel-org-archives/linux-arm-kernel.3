Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66D4606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IqwOrEjo;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=XbiFhlDv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5uHMqeGCi5xEjxp7eaOraEh1Wivt/hows3ISRJRA5sc=; b=IqwOrEjoEYliuU
	cvRjCSR0YCvNsKoPIsIqIjIEhZkcXLANuzvl2CIbeAizJuZ7PjbERyKO0HjxP9zyC+AjPOBhkbQrE
	h+dXRPYWQ4fnOxra19+SVU4n1KLsmXTLY3YqVk2ZqTynKfQj9MRDNhaLLaVfdMIm72C5gMadOoZ7v
	jOb9Z1dZjsqFJLg3NNL2ysnPUuVEZJZQxaI3XYy7gz9iuXLhfOzg3669PlgCvWJWrcq6gD6787gUD
	yMPq/WYTdVtM/DCrQ7g9YG7SBQVwyRiSZj9bhC2RcyKjkzkBBbwRpi+RYbf8cW4SfeAB6/rAcfA4e
	uK21y5/5948oc62syJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTu6-0000000E9Nu-0Kfz;
	Sun, 01 Nov 2026 11:39:14 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTu2-0000000E9NG-3zvf;
	Sun, 01 Nov 2026 11:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793533145; bh=5uHMqeGCi5xEjxp7eaOraEh1Wivt/hows3ISRJRA5sc=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=XbiFhlDvI6WGK8Bsvq8LH7n0vu1J/qtX7NScBAtj1EFYUeJUcTbZLekmvevT4pDJi
	 L8u+hNlUKJHvEKRoq6/56YUkF+SlBI972ERJOauNdaKGMX/9/22qjutC2Pm6sbAO2q
	 NsM/l0TijMC1xEp+42hCMB2mLk/6qIvFEfR/1PJA=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-XMAILINFO: NkQGnmzToUyF0HQ0dYoXDCd8WAlZNEOU7fHjxUZdzBCyuy7mN4509D4z/oFOLF
	 mp8O3+8yYpU9EBj+4Wa1B83pgvDaatwTABEjm54x+Tj652l17NWrmh8FnTeBZ8iisLukH531dkto3
	 1epOliaRAypX17H3VMsY07+Wvgqk9e5GsxJ4YxIqwiAtoCfpizYbPcirRK8jekIKSsGuE+TM+9YLr
	 AU2XW7tYus4vIUesvhJ346t5rtR4aUwsMdXBsoOa2HZapPMreMozjuMFK5bwW/iIjH6dIxifSuROa
	 +qzyzbrr2KyhW9UgAZib5YZeiP8HHHXR0+g2tyFZ6e7kSjHC4GSi8qadlRcxWfoIR5YbpJi+I43fA
	 OD2k4aB2C2XdGdWmoTpgLRQsVfJiG8NntDpUwa4rOenYOo/WQzDKvvkNHWxamomjilq3bZLADTeXm
	 8UT/Y6ZANI7fF96dpgTxR2wGcbnrUJDKNfx9J3r/1MdwjKDY3cXo1BfesRbo0WvJI66tWuYxVYT97
	 hQypgWt0hBqWYcOMA672gQq2wzqQ/kq6hNVb5OrxmZ+cxcA0UrSzel4V+8Xqs6/i5LlttU7HCmeut
	 ebxATsgi8CqSuAmOXtopJ34fW38TwplM9fGbTsA5a9Of2Bv1srR0O9+f5EaRTIv//zZLppQMuVNW6
	 vVH1s2yzLyUrEKVp40L4CIUPPFcH/7XQaMu3Ex5YDVDryrVJJJKNvuvwCTN3ynaeI0Drar8n0vbAT
	 LhJek8pdik/8YpUYCFZkMwzPv3IlRP70FA42CdsVe2rb+LQsnLyw5wmYdFPVsEnmprnWWtwtexqlu
	 UT2TSA96rGmBUqgqHO3XCw7Py88VgePSu0+HZXrVQSgQLQM5N9HD7BwemBa8dcccqND2hCHjmd37A
	 dccK23A7bq37MpdZT1/dOdzhlFZNLWXRiORJiyZw/QMfJxce/w6qwZF3vnH92m84vgdj+w5oRVwHe
	 8LaTrvTY26iR0TVigTrR/KMO5P3nrpa8BfiZUAUPYScNOl0stTaTm0q9Z2KOE9Um9F2uhZDng9585
	 ksoGddMClOCvlkKFDu8STVWDH5fhueHuRwyvinVRN8h9L506imQ8DvXDZ698ulVpfx43u
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?TWFuaXZhbm5hbiBTYWRoYXNpdmFt?=" <mani@kernel.org>
Cc: "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bGludXgtcGh5?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 21/27] phy: rockchip-inno-usb2: Add RK3572 support
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sun, 1 Nov 2026 19:39:03 +0800
X-Priority: 3
Message-ID: <tencent_650649C624E17C043BA00BB1D4CFB8498105@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <20261022-add-board-ok3572-c-v1-21-0b0fd85a31ee@qq.com>
	<179353031285.2955.4272173079718014092.b4-reply@b4>
In-Reply-To: <179353031285.2955.4272173079718014092.b4-reply@b4>
X-QQ-mid: xmsezb41-0t1793533143tqyga0g4o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_033911_529919_6C8CFF0D 
X-CRM114-Status: GOOD (  13.02  )
X-Spam-Score: 0.6 (/)
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

SGksCgo+PiArIHJlZmNsayA9IGRldm1fY2xrX2dldChycGh5LT5kZXYsICJwaHljbGsiKTsK
Pj4gKyBpZiAoSVNfRVJSKHJlZmNsaykpCj4+ICsgcmV0dXJuIFBUUl9FUlIocmVmY2xrKTsK
Pgo+IFBsZWFzZSBpbnNlcnQgYSBuZXdsaW5lIGJldHdlZW4gZWFjaCBvcGVyYXRpb24gdG8g
aW1wcm92ZSByZWFkYWJpbGl0eS4KPgo+PiArIHJhdGUgPSBjbGtfZ2V0X3JhdGUocmVmY2xr
KTsKPj4gKyBpZiAocmF0ZSAhPSAyNDAwMDAwMCAmJiByYXRlICE9IDI2MDAwMDAwKQo+PiAr
IHJldHVybiAtRUlOVkFMOwoKSSB3aWxsIGFkZCBhIGJsYW5rIGxpbmUgaGVyZSBhbmQgYmV0
d2VlbiB0aGUgb3RoZXIgb3BlcmF0aW9ucyB0byBpbXByb3ZlCnJlYWRhYmlsaXR5LgoKPj4g
KyAvKiBTZXQgdGhlIG5vcm1hbCBsaW5lLXN0YXRlIGZpbHRlciBpbnRlcnZhbC4gKi8KPj4g
KyByZXQgPSByZWdtYXBfd3JpdGUocnBoeS0+Z3JmLCByZWcgKyAweDAwMjAsIDB4MzAxMDAp
Owo+PiArIGlmIChyZXQpCj4+ICsgcmV0dXJuIHJldDsKPgo+IEhlcmUuCj4KPj4gKyAvKiBJ
bmNyZWFzZSBIUyB2b2x0YWdlIGJ5IDUuODklIGFuZCBkb3VibGUgcHJlLWVtcGhhc2lzIGN1
cnJlbnQuICovCj4+ICsgcmV0ID0gcmVnbWFwX3dyaXRlKHJwaHktPmdyZiwgcmVnICsgMHgw
MDBjLCBHRU5NQVNLKDI3LCAyNCkgfCAweDA5MDApOwo+PiArIGlmIChyZXQpCj4+ICsgcmV0
dXJuIHJldDsKPgo+IEFuZCBoZXJlLgoKSSB3aWxsIGFkZCBibGFuayBsaW5lcyBhdCB0aGVz
ZSBwbGFjZXMgdG9vLgoKSSBhbSB3b3JraW5nIG9uIHNwbGl0dGluZyB0aGUgcGF0Y2hlcyBi
eSBzdWJzeXN0ZW0sIGFuZCBJIHdpbGwKcmVzdWJtaXQgdGhpcyBwYXRjaCBhcyBwYXJ0IG9m
IHYyIGFmdGVyIGFkZHJlc3NpbmcgdGhlc2UgY29tbWVudHMuCgpUaGFuayB5b3UgZm9yIHlv
dXIgcmV2aWV3IQoKQmVzdCByZWdhcmRzLApDdW5oYW8gTHUK


