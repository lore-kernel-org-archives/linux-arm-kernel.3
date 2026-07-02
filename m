Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BADC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnW870l0yC9mr/LlBv2UdLFBV+iCbhzmV8aj4QwT7js=; b=qlsIcJPkQoOaifShNve2HJz3C+
	qK06hqdN8T8od7srE6cv1ZzmEqlO81GKDDSWRG6ODj13wH6Xgk41NwHOsKG7ubzXXJyjjW23GwKMC
	GXvUyqSnu+QHf8WkbrEqqATmsS9GHpomZb8vjn13v6YZyOGAOfsiU5RxCkejH51AHWAT9ZVcixojG
	Q0aKZ/iJvshs/2g5BCWjXcCYncMa8tFjNLWvlAga68/eG1Qh6WzqWKF+hofodSsaG2W3SN2wwxDmf
	tgKsqH9XJHv2k3DcgQ/mVhrC5by3ZL4vRHkK4eds/eTpJ6lCEwmAtC7h6zQGJjoRRUlVwKC8yK8h0
	2Vkk4aGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKL9-000000051CH-2OL9;
	Thu, 02 Jul 2026 16:32:39 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKL5-000000051BA-2eDH;
	Thu, 02 Jul 2026 16:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783009949; bh=OnW870l0yC9mr/LlBv2UdLFBV+iCbhzmV8aj4QwT7js=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=QU0osGOyGI/BXIufuCqgEKLUvS13kiSG1XC/OC14urB7LTIPReyVlR760ZG/2Wy7k
	 CozVNZw/3xXIzg4dXANourDVd0ebKApkV2P0uokrASkzkKIybKjOOLEcHEYjq9qx0r
	 1gq5unV8ilAv9KsYXBoQpzZAi1wsHpun5mkxIFZE=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-XMAILINFO: McF9JvsryK5J2MbxooxpFinMQvrcWw5im6o2Q6S6gW5u3vK+e7cbb8hasHzSKI
	 bcHTBt+6j2qlIdyMSYAtV4T4FkElEeOkhPgUjutEqxSZlE9pwpXcmYwVL07UwlPWfKyDB/k7yJPCd
	 O/FwzzTIDfS6OMkFEs9WAYsIQIOWNO+byR197KMqoN69geEX3QNLF4uCZeS9sssoBvgUbE7eHtJ73
	 uLxAtB59HYqah38S61HXgi7+ecvVPE2eAoocyRHDXxtREgZE4n9kB0+cKPWhgzNQ+RcWfexXszztR
	 KKTxN+RDMYhH2tZox94LMxZO0QxJbV5OWgEt4ZPNBgosE6wmjyU/kWY/ynBS9NjV4CrEGBhpP8pgE
	 kKrx5xDLW7Ylf7x0n03qpySTyuk/y0P5ENgh4lsbd6nCPP2SjYirm2UbNATs1ARVThiRQAHR7xeCH
	 RjHXuoZE4ISLTI5Hnyca1FBFBMtv+PU1e+c/xx10pOFi/TwkxfRYWjFHw50+m0Okder38GSiOXR1F
	 NQn9PFhTcEYqsMInYAQKW6uXJqoaqRpX0Li+7TJ9wk4jjsiOMq5Z7AApJpHGDojBEsJt7QXt74oS/
	 BveXTjV0ZYpWevj3fD4aDytAo018wnoFb86DPsGuqMP2/bcOtManjx+CPn20yxVDKYJh3s+HrgNiA
	 XG9+uNODenrAhEugrR4mfA7ABssjjmXFuMCrO4RILgfAhB1ODwR5n9ZyAJK2AY+egS64dNI/yBh35
	 dWDV/jSUyjbuGIj7bWQsbElPpuRt3+IsuVqI/yeyc2TPQBlIx2msP+v0VbJ76S8MUsWMCakJIAh3/
	 E/ae8K8VWzdLV9aTnQbFO9FZC+kCGg3TrgUdiIeMs6ZTDxVMNskXs0B0FRJzhkYWMO29QCZyU9B1Z
	 bZL4rWB///fCE/W1WnSv9GkSXF0IJaInY+mpYt2RpXvX3E5R7vbjg4jDjvJjCGiaxvjx3rJUSXJin
	 U8zbkaK2CTClnmuU97UpOUqyzo4h+otk3jvZMDkV6x7EOylkMw1ZhITE52UobaUR1DcJqfl/BRLS3
	 hqOio78a22z1UZ2t25FSQnHF27mNnp4CrZgQK4EAhmPoLjDt9DfTyU0c6vQ==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?SGVpa28gU3TDvGJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>
Cc: "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?RG1pdHJ5IFRvcm9raG92?=" <dmitry.torokhov@gmail.com>, "=?utf-8?B?U2hlbmdqaXUgV2FuZw==?=" <shengjiu.wang@nxp.com>, "=?utf-8?B?UGVuZ3BlbmcgSG91?=" <pengpeng@iscas.ac.cn>, "=?utf-8?B?UnVzc2VsbCBLaW5n?=" <rmk+kernel@armlinux.org.uk>, "=?utf-8?B?RXJpYyBCaWdnZXJz?=" <ebiggers@kernel.org>, "=?utf-8?B?TWFyaW8gTGltb25jaWVsbG8=?=" <mario.limonciello@amd.com>, "=?utf-8?B?S2FybCBNZWhsdHJldHRlcg==?=" <kmehltretter@gmail.com>, "=?utf-8?B?WWl4dW4gTGFu?=" <dlan@kernel.org>, "=?utf-8?B?U3RlcGhlbiBCb3lk?=" <sboyd@kernel.org>, 
	"=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD compatible
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 3 Jul 2026 00:32:26 +0800
X-Priority: 3
Message-ID: <tencent_E65CC81827F48E7C0708213AFA3934F9D00A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20260702140654.2961561-1-1579567540@qq.com>
 <tencent_3B2B6003D1DE4FB7A984665A062581766405@qq.com>
	<2459655.BjyWNHgNrj@diego>
In-Reply-To: <2459655.BjyWNHgNrj@diego>
X-QQ-mid: xmsezb41-0t1783009946tqms5g9r6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_093237_413550_9B7B3DE3 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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

PiBhZnRlcsKgZml4aW5nwqDCoEtyenlzenRvZidzwqBjb21tZW50Ogo+IFJldmlld2VkLWJ5
OsKgSGVpa2/CoFN0dWVibmVywqA8aGVpa29Ac250ZWNoLmRlPgo+Cj4gYW5kwqBkb2luZ8Kg
ZHRic2NoZWNrwqBvZsKgdGhlwqBiaW5kaW5nwqBhZ2FpbnN0wqB0aGXCoGR0LXBhdGNoZXM6
Cj4gVGVzdGVkLWJ5OsKgSGVpa2/CoFN0dWVibmVywqA8aGVpa29Ac250ZWNoLmRlPgoKSGkg
SGVpa28sCgpUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIHRlc3RpbmcuCgpJIHdpbGwgYWRk
IHlvdXIgUmV2aWV3ZWQtYnkgYW5kIFRlc3RlZC1ieSB0YWdzIGluIHYzLgoKQmVzdCByZWdh
cmRzLApDdW5oYW8KCgoKCgo=


