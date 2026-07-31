Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1912BC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiIiDwni9OurStl7pRO7ZhqiyVf3ygxX/NwmFxj//ws=; b=ssQ1tgOJSCX+7WuTkskuP7HKkN
	9Yq8sSEjliZCd6zTk8AyiiLb44k1w0Pz8YBy7UY9YM0QlRjYaivE8atett8T0kA3ShZfQsADaaPQd
	Bh0uKeU05y3/YhFFKkwTp2OrkBjYYJhhlZpVkLSD3xqZolnhD7+vJHBIkj7M8aOv2jpq3mcslfOV4
	BLLy7rk05Xv9qHgNNntoIVDc+S2ZK2UjNr53fEfgzSngCxALygDgxGPS8r+MHYFsjBqhNDIlfTilj
	n74NkxRZ8LcM3a3WyEcM626e3R5xFkh4BPqJ7AZ3TBu4yFk+AzdoLwnJ2mb3IfnSqLHeus15ZzdTd
	I2Xz8aAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjTA-0000000CBBf-3rqy;
	Fri, 31 Jul 2026 09:23:56 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjT7-0000000CBAg-2K95
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 09:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785489828; bh=XiIiDwni9OurStl7pRO7ZhqiyVf3ygxX/NwmFxj//ws=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=ZL3eO6DVQIr4Re4Al7cmK8X9Yn21ixyz5yaCqpOiw08ChgoqiY6xNOM93bhhwnPTp
	 dKIIkuswSpFmhQZGkLEy9z8ccuh+nP85/TsCYnw2AfH3omeay7NKNshFIOxYzBlUTV
	 hLA7yVo8zC8dsJ2TeI1nuNcZtpyJxjPHjmKOSkOE=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-XMAILINFO: MdmyWVu0InhASr51t+bh5d00P15ddVfHxAAtw92Y7cy3+tpnleiyxscsCHM8Bo
	 HSoDUv9Jf67J6A3E7utHTCs2SbiQJE8/ph1uWVKiD7IE0TRGiCeLNpYazT8JzJ3hr2voI7hPsH6CP
	 ZxQH+Swm4aeJrx0+igr8sq7KaMbwxRoN9LlV7Argn70rFcUVWc48AtF06Gq6ZIrQh+hVRKq5AuteS
	 ecODuSy08oGNSTrMwnvLTWT6DqvcH48rvKPWBy8AvxeW0lEHDqLYtp8rLsmDdQv8PFICHk7IOWd4y
	 3O5RbwiPsT7V64ACizMdduFJDLgxpPdn5R1+LpFYlpEKBlCNymOiHGmDEaSlsVai8njwfmGuYS4ZO
	 689FqoE8+UHVXA/i0zkcQjsbZP2ubdv/l5N1QbaXHRyJ2z6qssJ76xODSrUzCPgWSZFtc92u1CKFb
	 4v8qomZy8F0fxpdvtsBEuSbxPF4DXWo08a/aQZIrRAPED/pbWRQU0O/CmTJC/OvBnR9x1oAw8k6sZ
	 DEaHz6IkPmRQqsTQR2KOcaRYYHQHzPAiZVxp8FLinJcPWE52db1akCY+b/b53xi2719JzlQosPPhW
	 vijCRzF37jWJIKcfIX8UHNxjWISuORHK/UMx9BTPsIKHSzDkwrqOpJmddcd5rqEHHP8641djsgkRS
	 iG12O6VTtWCri6mIkN8dAOF597q15Bqw3GqiYfWAc1A2FiP3isVovb1Sv/oo9t2uVVE3WrpDJijvp
	 jhBuKJJ66Ck/2oxzVC/iDshGZApclmOOraBBaFOGL5/2bzsNDh487HP/Zbybcs6ALpVo/coYc5sdM
	 sRYUPfYbkwc2kr5zfCtUnZUzEuy5uEJYRJCC5OY3ABWmN3HRCaxH+OiX2NaU3XOeg0eK7rV8PdkiA
	 2cyY8xplPH+0oCcoaf99G8+QTZmjqa4SJKcyMf7dVifyv4C0emQEYBFYklQHOBq0h9kieSz4AIQ7+
	 s7WIcXMg5DgKuWwU5RDo0wHVww9d3JpKgwu7C70aFsah+5ofxmpj6kqK5V8rExW4DlWPOpX4NhgKp
	 2uOZrfahfc/QbVtNc+Xy2Y2PXBF5PXGVe7K9flomXjDpD7+E=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>
Cc: "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v6 2/4] can: rockchip: add RK3588 CAN support
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 31 Jul 2026 17:23:45 +0800
X-Priority: 3
Message-ID: <tencent_A3698A465C4621E164443B0005D1CC6FAE05@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_7BAA0052C402BFFD26291A64198084E39107@qq.com>
 <tencent_207E464D12344B3228096E23A001D6882508@qq.com>
	<20260731-tall-camouflaged-earthworm-e1a7d0-mkl@pengutronix.de>
In-Reply-To: <20260731-tall-camouflaged-earthworm-e1a7d0-mkl@pengutronix.de>
X-QQ-mid: xmsezb41-0t1785489825tvu85u5sk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_022354_340369_B92DA11C 
X-CRM114-Status: GOOD (  10.19  )
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

SGkgTWFyYywKCj4gQ2FuIHlvdSBhdHRhY2ggdGhlIFREQyB0byB0aGUgQ0FOIGZyYW1ld29y
az8gU2VlIGNvbW1pdCA1ZTE2NjM4MTBlMTEKPiAoImNhbjogbWNwMjUxeGZkOiBmaXggVERD
IHNldHRpbmcgZm9yIGxvdyBkYXRhIGJpdCByYXRlcyIpLiBBbmQgY2hlY2sgaWYKPiBDQU4t
RkQgd29ya3Mgb24gdGhlIHJrMzU4OCB3b3Jrcz8KCkNvdWxkIHdlIGxlYXZlIHRoZSBSSzM1
ODggVERDIHN1cHBvcnQgb3V0IG9mIHRoaXMgcGF0Y2ggc2VyaWVzIGZvciBub3c/CgpJIHdp
bGwgdGVzdCB3aGV0aGVyIENBTi1GRCB3b3JrcyBvbiBSSzM1ODggd2l0aCBUREMgaW50ZWdy
YXRlZCB3aXRoIHRoZQpDQU4gZnJhbWV3b3JrIGFuZCByZXBvcnQgdGhlIHRlc3QgcmVzdWx0
LiBJZiB0aGUgdGVzdGluZyBzaG93cyB0aGF0IGl0CndvcmtzLCBJIHdpbGwgZW5hYmxlIGl0
IGluIGEgc2VwYXJhdGUgZm9sbG93LXVwIHBhdGNoLgoKVGhhbmtzLApDdW5oYW8=


