Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9FC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uLxLOxa+;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fUyjrIWN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STANDc24tjLvIjwpWVUmAsj3lx2tDmc6YgtW+icG3B4=; b=uLxLOxa+i7Ax5CWbbj2apnRzCI
	LgnGroSolPazumnkfEOOF9IZEvITwK+17liVRIM/D5d+6S6jOWpsOGt55rxxrj2qDtxtVPIbqhSnn
	jb/nYy/tiUKSg1BTmcEFSFDoGVRQpndP9cI97anLi91w+/bJ/NLYroYxo7JgqHaNZrdNsRhY0LyGQ
	uFH2SFvUTRiutiN7Gnynp7PdOLW+c2lHmmQjEBF3gQOJGdeWmXozxEHAEtwGplI77uCrDBNSmCGUC
	njciYBt0b5annuusWhubq3FTsLQwkpGBAED/1dHkEfufonVM0dKacxF11AZf+aMXVYxf/MuLTwpfe
	D4/P5EnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoD7-0000000DfU0-0PNz;
	Thu, 22 Oct 2026 08:31:41 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoD1-0000000DfC8-0J2s;
	Thu, 22 Oct 2026 08:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792657892; bh=STANDc24tjLvIjwpWVUmAsj3lx2tDmc6YgtW+icG3B4=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=fUyjrIWNZngROUclxWWKZVyN/bRgeThQB4k/DjoUpctc/a8tx8gCiSYfCCsdEKoOT
	 eI6Fcpgm5nbNe6p1TI3zdXAuoVAgFwv97ir6Fo0KXMCbikO9gAi1ZiyB5afHEPF11I
	 YMmMjBP4xH0nfUlUFSPm7uP4PbORqu3v0foxg+a8=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: MdmyWVu0InhAZ8CuOl+WbGFKb0ebdFMF3mPSDUyiHYO6r7cCGW4mjYzB3NBROn
	 A9jpVSF4u5EGvEY+hd9HqK0oJrog5xvbOMlpipPRJufSIYbzcDiHl7z1PQMAap6nUQRMYmsXXrTj2
	 tk0tu+feORbWkh2MZvFlU6kFWGBDTovA9C78iIph96PStjs9Es57Lo5xtDOysKUKMazNBnBIRzXyV
	 MrDMJ/nR6ENpT11vObm03xfcgHiUZmvbLYBNxYzkM9rWk/c8kXIUlrVRHSrjx1mJjWSwuR5ikLS90
	 IA9oWFvjt5F1LrALDB8oYuhsvLYKtLJ5ZkmJZCMyfCvCIOrYeHecIvDsFyx+oo5L4n3vgJ4ILNe7w
	 IWF/UoBKpSMC6IECVj2Z9f319IRWT7EtoQ3/KSPMVurUnn/z6RI9NhVutrd7FEEPyf2psClNX8xxs
	 s3PodM+x6fnfX+HsW82g3vD8H2txXYRk7zN+9LrD09FtOt6JshsmPGwwAeMukpJ98J91aFKfwVtXG
	 hBG+k2dK0PJajAwkc9bcbgYtz+Q2QR/RrNM6mtAf6w1rBmXaym1TMdQrgHoBFJdV2Yq2POKQKAvme
	 EL86NXj9H2XUOECt/ikrQ4GvvRhc0W9Wo5HM2Kne7g8Tierj5RJN8KGA9QCQrgBYDnaAMIirrE89H
	 /jI/jnpkPoEF6rQGbKH3V/RamkwDMVcm5rYvbUthGDSPKmiwUJk1kKo+Iyv/ZHZrmPUxG48EfbqTn
	 HwXwLKP5guQm5Gr592nEMxLOh8CzkPL9PdfBHto0MAlW9nSWwpa6DmlElREMdAJrqEaSDrqmzII0S
	 sRL9obZFk6mBkHY4RseG3hqBrBd+TNy0yz+nfoR6xF3WORhgAZbTIwwUQwf4/zUhc5WO6AamzLy7e
	 JEZv0CDUEAtadJBWrvTVq+ZCI77/7ajFV0NgGLf9cPk9NrxnZnSqBHWuF/1iL6D3H7rwgSZ5puDA8
	 FC5wND+fVe7bNKWVf/B3mWtxt6n1/TKztIPBU/DRVcT1NTS4JlKx6oT9ngX/okTR18+YLz8bG04q4
	 K40wSnuLyRd1DNII7GNYR7vz6pxerbM2KyZCwhtwsaRd49zRlHj2xiYVP5iDbcjjkWk/Vy7nD++zK
	 zkFHOwuBXxHfZg==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?SGVpa28gU3TDvGJuZXI=?=" <heiko@sntech.de>
Cc: "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bWZk?=" <mfd@lists.linux.dev>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?bGludXgtcG0=?=" <linux-pm@vger.kernel.org>, "=?utf-8?B?bGludXgtaTJj?=" <linux-i2c@vger.kernel.org>, "=?utf-8?B?bGludXgtc2VyaWFs?=" <linux-serial@vger.kernel.org>, "=?utf-8?B?bGludXgtbW1j?=" <linux-mmc@vger.kernel.org>, 
	"=?utf-8?B?bGludXgtc3RtMzI=?=" <linux-stm32@st-md-mailman.stormreply.com>, "=?utf-8?B?bGludXgtcGh5?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 07/27] clk: rockchip: Add RK3572 clock and reset support
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 22 Oct 2026 16:31:30 +0800
X-Priority: 3
Message-ID: <tencent_48E1098E2322016888397E2F4D1D34343208@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <2339330.72vocr9iq0@diego>
 <tencent_791C8CE4050020CEF9E536C9D3B4CA9C250A@qq.com>
	<2117228.PIDvDuAF1L@diego>
In-Reply-To: <2117228.PIDvDuAF1L@diego>
X-QQ-mid: xmsezb41-0t1792657890ti513lphq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_013135_450124_FBE64A5F 
X-CRM114-Status: GOOD (  13.88  )
X-Spam-Score: -1.8 (-)
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

SGkgSGVpa28sCgo+IFJvY2tjaGlwIGhhcyBwdWJsaXNoZWQgYSBkZXZlbG9wbWVudCBicmFu
Y2ggYmFzZWQgb24gNi4xMiBvbiBnaXRodWIgWzBdIC4KPiBUaGlzIGluY2x1ZGVzIHRoaXMg
Y2xvY2sgZHJpdmVyIFsxXSBhbmQgbW9zdCBsaWtlbHkgYWxsIHRoZSBvdGhlciBwYXJ0cyBh
cyB3ZWxsLgo+IFlvdSBjYW4gdXNlIHRoaXMgdG8gY3Jvc3MtcmVmZXJlbmNlLgo+Cj4gSWYg
dGhlcmUgYXJlIG11bHRpcGxlIGF1dGhvcnMgY2hhbmdpbmcgdGhlIHJrMzU3Mi1zcGVjaWZp
YyBwYXJ0cyBvZiBhIGZpbGUsCj4gcGxlYXNlIHVzZSB0aGUgZmlyc3QgcGF0Y2ggYXV0aG9y
IGZyb20gdGhhdCBoaXN0b3J5IGZvciB5b3VyIHBhdGNoLCBhcyB3ZQo+IGRvbid0IHdhbnQg
dG8gcmVwbGljYXRlIHRoZSBkZXZlbG9wbWVudCBoaXN0b3J5IGZyb20gdGhhdCB2ZW5kb3Ig
a2VybmVsCj4gdHJlZS4KClRoYW5rIHlvdSBmb3IgdGhlIGxpbmsgYW5kIGNsYXJpZmljYXRp
b24uCgpJJ2xsIGNyb3NzLXJlZmVyZW5jZSB0aGUgUkszNTcyIGNoYW5nZXMgd2l0aDoKICBy
b2NrY2hpcC1saW51eC9rZXJuZWw6ZGV2ZWxvcC02LjEyCgpCZXN0IHJlZ2FyZHMsCkN1bmhh
bwo=


