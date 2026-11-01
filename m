Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813D5606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 11:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iEG0vlrw;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=zuHVTW5t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4PXzGc2Rw2fCXjkklglmjwOBpwPL/t0RkrO1+a8BwTs=; b=iEG0vlrwk5qbEf
	Q8jBUxK2gdNhnoO6bF0ygrVVf7VqOZArWu5zyMFTDmaTJHp69OWHGJ+lNdcG0H8PnizhbKiuf4ylG
	ELB7gEZ3udzwoSwxp1fyQNGAc15I6zU9TtAy6HIQF6vQHNA6ibIQlHS0oj4K+aTEa6frtrRd644Bb
	vduB9is9TMyTRDVcu7wCzUuf7Sx5P8Yfryey9XiZ/LtBxBQO48bXu6zHW2Qf2ZFiPP/P4EiHDEAVv
	kHByRaJRs7Circ1rBnYryB2GqXsbAnzKr4RRyLUOdzkqbSluNXd/VbGA6igr6pqnldMb+IuoGV4C/
	y4rMdbC3HJpXmnVCp0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTmt-0000000E98K-1MZL;
	Sun, 01 Nov 2026 11:31:47 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTmp-0000000E97F-1RiT;
	Sun, 01 Nov 2026 11:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793532694; bh=4PXzGc2Rw2fCXjkklglmjwOBpwPL/t0RkrO1+a8BwTs=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=zuHVTW5traxZzn7gUPJQzknvG+nR+QwyXrFO3v5WEaqzbrVbjLyfuHkhh46TEzDZD
	 9w07+o/XwWCYXC+BFh021ps/ZUDKzZM6kbsTbPEsJADmRVRn3E2KfsSfodVAMBNL3B
	 1/UnuvVzzFFVwL9ap+Go3dS1sz3JMr/wkGaEt3RQ=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-XMAILINFO: N55iztL8edgQybSWYxuz+O1+9mOuF4a6o9IlPHWQBhRVZDIrch1h77KPomNJ/B
	 Nw0cRyirxwQuJC/Zmd9tvtdVZv9PIkx4G8zIqW3WkKGx3+cz5H6hAW0nO2abi4WxCICewmrkz24Y5
	 4gDCn5unlZ9E3H60lTVIBbeedRLttniY1vF6P9OkMwhsxezC6F/Wdf7dIRvfr+YD+120vBhn/EVBX
	 Z0N4RXfibxF4cTfeJfIO9XgA7m9H/qNUUUk8L/7XCfIxNeszcTEPCGxFw6cbzvCR8bK0urlao9GMp
	 b37eQJj1TNDomNLU4TlauNG2MLLe/m6YT/3/daLN4faXMG9c3Xv8RaIs6t2zXF5M9/eeO1kd6UZ2b
	 qRRMx99oge2xpz0V8EtCD10Y5P1nGdSQfF2s8jOzNVqJGx6NJyHBDk0jc+rhHR9yR/SPYT8f6qrW1
	 4AH8rJhciGcs722AuzpnWmRIZU+HlMtmSespSzXPb/TB+bLm4QWrGZ43zbe9ossVbsrsjxrneGKmS
	 iJ3OANCDWjL62o2EH5AQxN87S9cp0sdIgWeXC2gkMiPbP52LwlhXkgqI13Wp61sJdjNESXD/tYMw/
	 FDqhNQEC/MuXxCKLRbfplE+7AKq2OIADHhXFBVNHxB+rPvcsspfezSH0BGT51y7K47ikmjMehRln2
	 XWXJ1TbdnuKbJHEt16Itz/HLx9CBfKekPE8HES17zLT+hFZ35ZGBKcUbidyOyFfPbkvr1ptXCJ5vi
	 jCfJJRhxeq4WHq0tXZBSqCzc2y6d7t/BOfI7Gb0ixJuT8p+VxWRBzVmqtHW85fHoTA37+dT4zoSOY
	 w8K/yEhg2nELVC6UMYix9sTVhxJsTDFQTbuITdWsJ9n0meTHwLdzzhm1rdiJobHe0SUzQm5WxIxta
	 3wh2swzy6RCJswD+r8vpyXjztAdk2Mk9f5zgSuLLHtAAiUwfAyvc0pBoQQRWitDOALiwngHR9cfSh
	 9+4rckDH+rQFDCSdGXFPIvdjjpbNrKpevfwBSE9Msw10Uq7yxuPAgGU2didtugTq2H4sFXiiObg9Q
	 bIM9UM6CLnA2PE5SoggXwT3z2442zqIKO00Li2FJRLYqZppzIxLq1grqXRclociJt+SPB
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?QmFydG9zeiBHb2xhc3pld3NraQ==?=" <brgl@kernel.org>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 09/27] gpio: rockchip: Add RK3572 GPIO support
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sun, 1 Nov 2026 19:31:33 +0800
X-Priority: 3
Message-ID: <tencent_82A28995065FC62D017F243F201551C14F05@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com> <20261022-add-board-ok3572-c-v1-9-0b0fd85a31ee@qq.com>
	<CAMRc=MeNF_=T2Yb6wzsQFFcpO+w7sLgaKR=sZhZRzRDFcpgumw@mail.gmail.com>
In-Reply-To: <CAMRc=MeNF_=T2Yb6wzsQFFcpO+w7sLgaKR=sZhZRzRDFcpgumw@mail.gmail.com>
X-QQ-mid: xmsezb41-0t1793532693thpegsapc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_033143_729368_B0C3C8AB 
X-CRM114-Status: GOOD (  14.94  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgo+PiAgIHBlbmRpbmcgPSByZWFkbF9yZWxheGVkKGJhbmstPnJlZ19iYXNlICsgYmFu
ay0+Z3Bpb19yZWdzLT5pbnRfc3RhdHVzKTsKPgo+IFBsZWFzZSBzcHJpbmtsZSBpbiBzb21l
IG5ld2xpbmVzIGZvciByZWFkYWJpbGl0eSBoZXJlLi4uCj4KPj4gKyBmb3IgKHVuc2lnbmVk
IGludCBpID0gMDsgaSA8IGJhbmstPm5yX2lycXM7IGkrKykgewo+PiArIGlmIChiYW5rLT5p
cnFzW2ldID09IGlycV9kZXNjX2dldF9pcnEoZGVzYykpIHsKPj4gKyBwZW5kaW5nICY9IGJh
bmstPmlycV9tYXNrc1tpXTsKPj4gKyBicmVhazsKPj4gKyB9Cj4+ICsgfQo+Cj4gLi4uIGhl
cmUgLi4uCj4KPj4gICBmb3JfZWFjaF9zZXRfYml0KGlycSwgJnBlbmRpbmcsIDMyKSB7Cj4+
IC4uLgo+PiArIGFzc2lnbmVkIHw9IGJhbmstPmlycV9tYXNrc1tpXTsKPj4gKyB9Cj4KPiAu
Li4gaGVyZSwgZXRjLgo+Cj4+ICsgYmFuay0+aXJxX21hc2tzWzBdID0gfmFzc2lnbmVkOwoK
SSB3aWxsIGFkZCBibGFuayBsaW5lcyBhdCB0aGVzZSBwbGFjZXMgdG8gaW1wcm92ZSByZWFk
YWJpbGl0eSBpbiB0aGUKbmV4dCB2ZXJzaW9uLgoKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c29jL3JvY2tjaGlwL3JvY2tjaGlwX3NpcC5oIGIvaW5jbHVkZS9zb2Mvcm9ja2NoaXAvcm9j
a2NoaXBfc2lwLmgKPgo+IFRoZSBjaGFuZ2VzIGluIGhlYWRlcnMgaW4gb3RoZXIgc3Vic3lz
dGVtcyBzaG91bGQgYmUgaW4gc2VwYXJhdGUgcGF0Y2hlcy4KCkkgYW0gYWxyZWFkeSB3b3Jr
aW5nIG9uIHNwbGl0dGluZyB0aGUgcGF0Y2hlcyBieSBzdWJzeXN0ZW0sIGFuZCBJIHdpbGwK
cHV0IHRoZXNlIGhlYWRlciBjaGFuZ2VzIGludG8gc2VwYXJhdGUgcGF0Y2hlcy4gSSB3aWxs
IHJlc3VibWl0IHRoZSBHUElPCnBhcnQgbGF0ZXIgd2l0aCB0aGVzZSBjaGFuZ2VzIGFkZHJl
c3NlZC4KClRoYW5rIHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyBteSBwYXRj
aCEKCkJlc3QgcmVnYXJkcywKQ3VuaGFvIEx1Cg==


