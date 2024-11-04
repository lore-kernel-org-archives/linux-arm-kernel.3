Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96098D1119C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 02:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBnwjIu01qb3uMzu5oQLZ1sXef4WJoJ8ZJ5HXkRpTng=; b=eo04YwDceI7MdmpHLKZY8siOXb
	QMYvqh6+qs/3b7FP2pcE1yQcPFMyA29NDJ3Z80DbYK7MXBS/ijNfEc6ps+D8Q8REQ7ySQHHF13IGn
	KnkgDBgNm8Tiqcz1s5n+8vRc+vPOalWVVAHxKOXdf7oznZ0aM3z7CljLs99/pH01e8ewQoq4cLuto
	KtG2nlVAFLoTmWrxIXg8Q1hUAnRQLOeI8KMi0LCjmQ1g8LoeCukpw2etZY7UvF8iVGUuiOAiS3P6W
	OOGqT2dDl8B/mtqauXse5OXjmUjI3o2EgUQqU0wC6LlPe4g2QM32pVg+AN1FkPH5/cWDbT3iRyZpY
	J46swh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7mxR-0000000CTbA-3tz1;
	Mon, 04 Nov 2024 02:36:45 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7mvi-0000000CTPq-1Ekx;
	Mon, 04 Nov 2024 02:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1730687664;
	bh=LBnwjIu01qb3uMzu5oQLZ1sXef4WJoJ8ZJ5HXkRpTng=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=I0gkvfMVE/MguKNe6G+/LMNLVFqz7dkh0IDG0vDntK4CNMqCoz50Tqhzb3M0pX6yE
	 GsMB3HypNccbL/ypubSF6JPJFS7ckgk4c83b82I4kXeEhlwYuJQ9JJSgbhKj4ZgSzt
	 6AVc0wlL51Wy3m4xPQdNrps/E4wW0CWhuFCKwvFc=
X-QQ-mid: bizesmtp90t1730687661tfnba8nb
X-QQ-Originating-IP: zCt886bJnOZxcI98vSCU01cM2iwZOisAeH5BvJ3W5y4=
Received: from [10.20.6.66] ( [61.183.83.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Nov 2024 10:34:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13360692648225194716
Message-ID: <E7AED86A89FD886F+263304da-0529-4b4c-9e23-ea2e5e3cef2c@uniontech.com>
Date: Mon, 4 Nov 2024 10:34:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/18] loongarch/crc32: expose CRC32 functions through
 lib
To: Eric Biggers <ebiggers@kernel.org>
Cc: ardb@kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, kernel@xen0n.name, chenhuacai@kernel.org,
 xry111@xry111.site, sparclinux@vger.kernel.org, x86@kernel.org
References: <20241025191454.72616-7-ebiggers@kernel.org>
 <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
 <20241103135730.GA813@quark.localdomain>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <20241103135730.GA813@quark.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yPwlqMleUVPPs6iT7orBXJ4O"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MxHu/stL3hVPTyQKEN1I9xOGN+BWMXbxaMOS0j7W+ohxt+jGBkhBGwZ4
	mKISKoLBEd9DlDyAzvD8Xb+Ak/ELvHSM++rLK6y5TzF3Hf/17WFfm4pm9/k9mLloUcGW+NL
	8qZ+6cZzrdyjqSgcP1Xp/i5pEffVubQ2dMkyTuu3UHXF84Ui38G5dAI/uAmL5APJ4umWUjs
	JAlTTcK/ZnDz/dXBv4ZI87pL43bv608+HDpuFePggpjxgGa1kVYzobU5eUZ6LO/uv2RowEK
	uhKq8QAeAPI+IMf1b6aLSu6P/Fs/km10//7pfxHG6dA+7Km3UUBoxHlM6u2nyaXKFibw80s
	t4nTGxp0efQ3Pfm9Sz2/C3rkybvwsRFVPfwxyAn/VgcfSodJAMgcZKgqSNpASPGkZXP4lL/
	k3H1h1FOKBoqUmyu7jUmymrjsrywBPtV49f5MFmBnQwrkwKQHK2oaFRwHbmLcnsoIOHE8Z/
	deJsmZLHkJlnAaYVaPf54mh8UQNn52S4MGXd5Yk5vLu5eU3kZqeA32eOGldP7Mb0CmmSAS6
	gtMsyTXIALbDLKcwPkPsXrS6tqgYJTgEau2ZzAxsNWrQjl0sRSIrHUxJSdhmubmgeXccIdZ
	r1vHGhdkaGTJkGJqM22umnfJNPXVtOLMQ6X5hKtTi5BYe9LhRtqHfXvmVj4p1Vl5eT9hXi2
	3DIJkAQUebz9E3jx1FLgXjJMHocjcNcEVdhImvslnERXJE1DLgArhO3UEsYiCJtmJYfPDD2
	aS/b2i0B2kduRaSa48Cb0Of/cdn84PSGqXDObVcHjWZSBNvZ2dpru68Uwhr99TVEG4IGgF1
	9eOXjq5Z4MrGfy6pZlOmaz4wPAryxd9VvG7ei7E5Aki854L1tCLeSXuBZ3DcVwlhBgs7ZE8
	TEjRNHBoYPk7hwnmmTNksvuvkSlftSKfeFFGhvbMd9a4Kj8wnwhazWqvsD5X+cHxHbX2zIA
	QuFp0GZUngV4M0SsIHIumND1dfxBkdyInuyK4vGBQSxCdodYauHuTByUkblV8feBGpEUYBV
	78cet9pPs1EBpoInNb8RBGGAIOcBBODfCC27xPiQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_183458_908238_AB9147EE 
X-CRM114-Status: GOOD (  16.05  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yPwlqMleUVPPs6iT7orBXJ4O
Content-Type: multipart/mixed; boundary="------------cIiC60yt0DtrRFabfn26CCc3";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: ardb@kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, kernel@xen0n.name, chenhuacai@kernel.org,
 xry111@xry111.site, sparclinux@vger.kernel.org, x86@kernel.org
Message-ID: <263304da-0529-4b4c-9e23-ea2e5e3cef2c@uniontech.com>
Subject: Re: [PATCH v2 06/18] loongarch/crc32: expose CRC32 functions through
 lib
References: <20241025191454.72616-7-ebiggers@kernel.org>
 <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
 <20241103135730.GA813@quark.localdomain>
In-Reply-To: <20241103135730.GA813@quark.localdomain>

--------------cIiC60yt0DtrRFabfn26CCc3
Content-Type: multipart/mixed; boundary="------------YiihG54060SCpWIarDHBVU6V"

--------------YiihG54060SCpWIarDHBVU6V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyMDI0LzExLzMgMjE6NTcsIEVyaWMgQmlnZ2VycyB3cm90ZToNCj4gT24gU3VuLCBO
b3YgMDMsIDIwMjQgYXQgMDk6MzY6NTVQTSArMDgwMCwgV2FuZ1l1bGkgd3JvdGU6DQo+PiBF
dmVuIHRob3VnaCB0aGUgbmFycm93ZXIgQ1JDIGluc3RydWN0aW9ucyBkb2Vzbid0IHJlcXVp
cmUgR1JMRU49NjQsIHRoZXkgc3RpbGwgKmFyZW4ndCogcGFydCBvZiBMQTMyIChMb29uZ0Fy
Y2ggcmVmZXJlbmNlIG1hbnVhbCB2MS4xMCwgVm9sdW1lIDEsIFRhYmxlIDItMSkuDQo+PiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMGE3ZDBhOWUtYzU2ZS00ZWUyLWE4
M2ItMDAxNjRhNDUwYWJlQHhlbjBuLm5hbWUvDQo+Pg0KPj4gVGhlcmVmb3JlLCB3ZSBjb3Vs
ZCBub3QgZGlyZWN0bHkgYWRkIEFSQ0hfSEFTX0NSQzMyIHRvIGNvbmZpZyBMT09OR0FSQ0gu
DQo+Pg0KPiBUaGVyZSdzIHN0aWxsIGEgcnVudGltZSBDUFUgZmVhdHVyZSBjaGVjayBvZiBj
cHVfaGFzKENQVV9GRUFUVVJFX0NSQzMyKS4NCj4gU2VlIGFyY2gvbG9vbmdhcmNoL2xpYi9j
cmMzMi1sb29uZ2FyY2guYy4gIFNvIGl0J3MgdGhlIHNhbWUgYXMgYmVmb3JlLg0KPiBBUkNI
X0hBU19DUkMzMiBqdXN0IG1lYW5zIHRoYXQgdGhlIGZpbGUgd2lsbCBiZSBjb21waWxlZC4N
Cj4NCj4gSWYgeW91J3JlIHRyeWluZyB0byBzYXkgdGhhdCB5b3UgdGhpbmsgdGhpcyBmaWxl
IHNob3VsZCBiZSBidWlsdCBvbmx5IHdoZW4NCj4gQ09ORklHXzY0QklUPXksIHRoZW4gdGhh
dCB3b3VsZCBiZSBhbiBleGlzdGluZyBidWcgc2luY2UgdGhlIGV4aXN0aW5nIGZpbGUNCj4g
YXJjaC9sb29uZ2FyY2gvY3J5cHRvL2NyYzMyLWxvb25nYXJjaC5jIHdhcyBidWlsdCBmb3Ig
Ym90aCAzMi1iaXQgYW5kIDY0LWJpdC4NCj4gQnV0IGlmIHlvdSB0aGluayB0aGlzIGlzIGEg
YnVnLCBJIGNhbiBmaXggdGhpcyB0b28uDQo+DQo+IC0gRXJpYw0KPg0KDQpBY3R1YWxseSwg
bXkgb3JpZ2luYWxseSBtZWFuIGlzIHRoYXQgZGlyZWN0bHkgZGVjbGFyaW5nIExvb25nQXJj
aCANCkFSQ0hfSEFTX0NSQzMyIHdpdGhvdXQgZGlzdGluZ3Vpc2hpbmcgYmV0d2VlbiAzMi1i
aXQgYW5kIDY0LWJpdCBtaWdodCANCm1pc2xlYWQgdGhvc2UgcmVhZGluZyB0aGUgY29kZS4g
QW5kIGl0J3Mgbm90IHJpZ29yb3VzLg0KSG93ZXZlciwgYWNjb3JkaW5nIHRvIEh1YWNhaSBD
aGVuJ3MgcmVjZW50IHJlcGx5LCB0aGVyZSBhcmUgbWFueSBzaW1pbGFyIA0KaXNzdWVzIGFu
ZCB0aGV5IHdvbid0IGNhdXNlIGJ1aWxkIGVycm9ycyBmb3Igbm93Lg0KTGluazogDQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FBaFYtSDVLYVhCci1UZHBEYkp3Y3JfTDBfbWJT
dz00SjMwdXdRMnhuMllEcz1IZzJRQG1haWwuZ21haWwuY29tLw0KU28sIHRoaXMgY2hhbmdl
IHNob3VsZCBiZSBmaW5lIGZvciBub3cuDQoNClJldmlld2VkLWJ5OiBXYW5nWXVsaSA8d2Fu
Z3l1bGlAdW5pb250ZWNoLmNvbT4NCg0KVGhhbmtzLA0KLS0gDQpXYW5nWXVsaQ0K
--------------YiihG54060SCpWIarDHBVU6V
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------YiihG54060SCpWIarDHBVU6V--

--------------cIiC60yt0DtrRFabfn26CCc3--

--------------yPwlqMleUVPPs6iT7orBXJ4O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZygyqgUDAAAAAAAKCRDF2h8wRvQL7u9/
AQCzme1hyYUbPe1s4tK4FtfJbQ1qS/eQ5ZNWEjUnEivrLwEA0UMghFUFO/92QNK3/a3a7O8QrCGS
Ov5jILXFpAVfTgw=
=fG9N
-----END PGP SIGNATURE-----

--------------yPwlqMleUVPPs6iT7orBXJ4O--

