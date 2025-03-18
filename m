Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5913CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 00:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR8t+yS8heBlVgKW1sJz63d4wBD18a6lsgVnNjdDSVQ=; b=emf0WA2YDewcvNArE4dZbc44Pz
	BRPizNDWB+LuLdE3FlT2LLJ5PxOSGD2SlK+v1n6w70NQ/s4/uECvuM3Xms2Un0BauexcuT9+Xf0pr
	Rc09myinvDq5kwycXXTfyL15+envMSlP+Mr45Xqt5Kuo4ql/a9BgynLwoyBDAeYWgN9TMtP22GjU6
	nTD+P2DDwBPO8Ff4BBIKFcGCQBo9i71HkchIDgDlH33D05JuCdGOHK9R6F31OF5SFRST4mQ3TepaO
	PnB8SQ7iFkzXxYTrAtbxdz0cUJWSTU1dTyrpMuuBR3sjbOq4/xWSOY3F+4sGY/w3D11+R/oUb7/bN
	6Us2UqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuL3m-00000004HQE-3XDS;
	Tue, 18 Mar 2025 00:43:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuL25-00000004HCp-0gX0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 00:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742258531;
	bh=lR8t+yS8heBlVgKW1sJz63d4wBD18a6lsgVnNjdDSVQ=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=VCrCjVVyQloxxKR8/vCcZEWhl5wH0TbTJ4YXNsdM1m459vlb+65LMjGKP9CX0nAE3
	 tJVaa65qgKEVGMBQaMuBNgaUr2xf4SwItxGtuNyXBJkewIzvA5uR7erUJtb8sgEzpk
	 bCLcwZCAnwgGIpGHa4WgGbF36CygZqJb3KrWPqYAUxhJI6gYa8dJD3qzxuItCr8tr5
	 swVtXVVcdY1W60feoPSNlo2DZwjj/AzN5xf9RO7oa1o855/zcvlLazk2hUIpYMSI2D
	 7eyN38fQyZ0ny1Tox+1N2Tv3H9aRHFKruU9MNJ0ShUS8gKOyIwRx8usmnzVYMmyZ1E
	 1kpKwxR4WSWrw==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5A04377BB4;
	Tue, 18 Mar 2025 08:42:10 +0800 (AWST)
Message-ID: <3270a7ea55fa28253b435da0b0bbce3adfdc00eb.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Chen <kevin_chen@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
  krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 derek.kiernan@amd.com,  dragan.cvetic@amd.com, arnd@arndb.de,
 gregkh@linuxfoundation.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Tue, 18 Mar 2025 11:12:09 +1030
In-Reply-To: <20250314112113.953238-4-kevin_chen@aspeedtech.com>
References: <20250314112113.953238-1-kevin_chen@aspeedtech.com>
	 <20250314112113.953238-4-kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_174213_402163_A2A12718 
X-CRM114-Status: GOOD (  10.78  )
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

T24gRnJpLCAyMDI1LTAzLTE0IGF0IDE5OjIxICswODAwLCBLZXZpbiBDaGVuIHdyb3RlOgo+ICvC
oMKgwqDCoMKgwqDCoHBjYy0+bWRldi5wYXJlbnQgPSBkZXY7Cj4gK8KgwqDCoMKgwqDCoMKgcGNj
LT5tZGV2Lm1pbm9yID0gTUlTQ19EWU5BTUlDX01JTk9SOwo+ICvCoMKgwqDCoMKgwqDCoHBjYy0+
bWRldi5uYW1lID0gZGV2bV9rYXNwcmludGYoZGV2LCBHRlBfS0VSTkVMLCAiJXMlZCIsCj4gREVW
SUNFX05BTUUsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBjYy0+bWRldl9pZCk7Cj4gK8KgwqDC
oMKgwqDCoMKgcGNjLT5tZGV2LmZvcHMgPSAmcGNjX2ZvcHM7Cj4gK8KgwqDCoMKgwqDCoMKgcmMg
PSBtaXNjX3JlZ2lzdGVyKCZwY2MtPm1kZXYpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChyYykgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKGRldiwgIkNvdWxkbid0IHJl
Z2lzdGVyIG1pc2MgZGV2aWNlXG4iKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z290byBlcnJfZnJlZV9pZGE7Cj4gK8KgwqDCoMKgwqDCoMKgfQoKSnVzdCBhIG5vdGUgdGhhdCB0
aGlzIHN0aWxsIGlzbid0IGFjY291bnRpbmcgZm9yIGRpc2N1c3Npb24gb24gdGhlCnByZXZpb3Vz
IHBvc3Rpbmcgb2YgdGhlIHNlcmllcyBwdXR0aW5nIHRoZSBkcml2ZXIgdW5kZXIKZHJpdmVycy9z
b2MvYXNwZWVkOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2Y3MzY5ZDYyMDVlMDVjN2Fh
YzNmM2RlN2NiZDA4YzNiMDg5NjBkNzUuY2FtZWxAY29kZWNvbnN0cnVjdC5jb20uYXUvCgpJZiB3
ZSdyZSBub3QgZ29pbmcgdG8gdHJ5IG1ha2UgYSBjb21tb24gdXNlcnNwYWNlIGJlaGF2aW91ciBv
dmVyIHRoZQpBc3BlZWQgc25vb3AgYW5kIFBDQyBmdW5jdGlvbnMgYW5kIHRoZSBOdXZvdG9uIEJQ
QyBmdW5jdGlvbiB0aGVuIEkKdGhpbmsgdGhlIGJlaGF2aW91ciBvZiB0aGUgY2hhcmRldiBzaG91
bGQgYXQgbGVhc3QgYmUgZG9jdW1lbnRlZC4gQnV0IEkKd291bGQgcmF0aGVyIHRoYXQgaXQgd2Vy
ZSBjb21tb24gdG8gYXZvaWQgaGVhZGFjaGVzIGluIHVzZXJzcGFjZS4KCkFuZHJldwo=


