Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7259CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 00:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt8AIN8qAukSlVfx8WoOC+JRHZZ9SvnJjxUFLq4fz1U=; b=nAmsJjxorLtdiCH7SxFESZDbCB
	S8bLAP3KeoNhpDsJ70j0MkuHSyFKO5KQ7f1MKskkUJ44JLXtD1N7Pabp1KRamr1ly6eXVN4JzCoC9
	PDEX8IxbTNN1++FvimD2MSCxg/siWTh109aUqLqJ8wyML4BenOYUE1/li4rJ+i9yDMcOT79N1EUQW
	T+LjOblUZ4y4OezNT5fqQeYyTnJQiV+BPL2khRkuwP7KlK2DaZzU5m7kqCOlc7l78ucbnF4i/e7Uw
	BX6Dzc8S4NPR39lpjm3c3v6A+QHB8VUqEiZ0a8A7aKgqWjskXtWvktglJb4PlRlYp/2luE1XSrKQf
	OtDdneGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v31c4-00000000kDh-1e4g;
	Mon, 29 Sep 2025 00:19:32 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v31c1-00000000kBr-3iL8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 00:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1759105139; x=1759709939; i=j.neuschaefer@gmx.net;
	bh=Lt8AIN8qAukSlVfx8WoOC+JRHZZ9SvnJjxUFLq4fz1U=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BIz14jAAsrTquW1fbQ/F8+HpPTRo1Ll656+UdqJWNQ/4vNk8PY4+Cp+MwuDVr7nM
	 i6lW242+BQxAdkESePyHTaJ9TaxCM5nzTMPHnIqASnQWCtEEyB7dHgl5vQoSk0aR/
	 YzryXKmFcPN7v4CdlNy5YUOtF0549uoov/fZJo8tMUH80Kx37VjfZWhMiJB5zHdzy
	 vrTC153EQqD5eZzt0kExDhRMB5NQEIY5Pplc5biUb0IBcwSCdlwm2TQyB3B+MxIG8
	 xC9M920YlcU1l2AwDeMlzK/DlcYOsafRiSc2CeLtgcnj+Pz08VlKaVv60rxr94jBM
	 M62+pq+muTOp+DkNSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.211.158]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1v0GRh27fS-002AU1; Mon, 29
 Sep 2025 02:18:59 +0200
Date: Mon, 29 Sep 2025 02:18:55 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Hanjun Guo <guohanjun@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jens Reidel <adrian@mainlining.org>
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
Message-ID: <aNnQb9gH8pzwfRJ5@probook>
References: <20250919184025.15416-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250919184025.15416-1-will@kernel.org>
X-Provags-ID: V03:K1:mpfxJErVby5sgsgG+O6lW+Mfm10x76g/DPgMe2L624TAqBfZSPD
 9A7GDpogG/T/4aIx03V+gQjRbeK/gGOB6KDVNhMjabD/vXXJGJOVAvcTYOjMonaJ0q/zReY
 XYp9Ha6W/ir3m7X7tROpeDfw69RE1mn64/xwKnnXjjeUOvKz6xSauPJ8ZPAXbb39h/WX1x2
 XH6B13tTKYUE7Btvxy9Rw==
UI-OutboundReport: notjunk:1;M01:P0:7IZ02XOkHWI=;hBkenYvrNjVlKliK5k9hfCttOjn 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_171930_217233_3E0065A2 
X-CRM114-Status: GOOD (  14.77  )
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

On Fri, Sep 19, 2025 at 07:40:25PM +0100, Will Deacon wrote:
> Big-endian arm64 configurations are vanishingly rare, yet we still claim
> to support them in Linux despite very limited testing or visible
> interest. Supporting big-endian adds unnecessary burden to reviewers and
> contributors which, without any known active users, is hard to justify.
> For example, recent work to improve our futex routines and to implement
> nested virtualisation support is non-trivially complicated by having to
> support both big- and little-endianness.
>=20
> Back in 2019 [1], it was claimed that Huawei were using arm64 big-endian
> machines in their telecommunication products but I don't know whether
> that's still the case and certainly haven't seen any patch contributions
> to help support or maintain it.
>=20
> Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
> towards its removal.

As of this month (September 2025) there's a new community project [1,2]
to revive aarch64_be. Jens Reidel (CC'd) and I are involved in it. We've
been fixing several aarch64_be-related bugs, but mostly[3] in userspace,
because the kernel support is pretty solid.

So, just so it doesn't go unmentioned, there is interest in keeping
big-endian ARM64 alive.

Best regards,
J. Neusch=C3=A4fer

[1]: https://aarch64.be/ (binary packages)
[2]: https://codeberg.org/neuschaefer/porting/src/branch/main/aarch64_be.m=
d
     (status and documentation)
[3]: https://lore.kernel.org/lkml/20250726235646.254730-1-adrian@mainlinin=
g.org/

