Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A241DCD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtuHGVXdvxA+eHBB8lQL4h1KqWaneZd2wuVLpQ3gaXg=; b=CfT+Eup+TfcA+HrggMoM8AMgBb
	/s5IhFjLGkKvmhiM5h1W6QlbCC0n5gU8ju7W5DCqTcP/bWhdsmmAicPqyVyGA/MDA7nMEsT8G6FYO
	q1P2oIzW92Qn3hGL6+Wu7O1mk2tuG7hR+a/Rxhy+w76ojBC7H8sKosoDkreg8rpudFJmdhxgDPnD6
	qgk+5veBYr+ekKLvXjaigHvdcK6MOGhEhXaDicQrXGsY3YxBfgPVNOdsVe37+2SyV5hGW4Ornzn8n
	zQkrdCF32WKFa7qI8i75bK45gtBjhqHqUEqS31grIxpG186p80erzOHOKBaF2/rTIb4UT7AMxNLsh
	F+kWSL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJl98-0000000BWhM-2Mpt;
	Fri, 14 Nov 2025 04:10:50 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJl95-0000000BWgK-2IGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 04:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763093445;
	bh=QtuHGVXdvxA+eHBB8lQL4h1KqWaneZd2wuVLpQ3gaXg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NBqH8na6t0YDaoGvhOypw+y0cGSiDZzvkOP1vNYbLDdsjf65755feM5aRqtVfz4/O
	 51wN/N2n+KxwL7SMWdtBzckHBOtbpNRtUiED+UfXF3tEaZ986gwqEGr7D+lYPbe/41
	 9yqdyzKpwcJ3Pn4/GdJ8dML8ktTpSL5zsbYBDr+Da3AGt2faFyhZpaqnm+501u+bxW
	 UAbHxsdxzeK7VOMEzmSihSY4LtHBJx3JXuSak8D6uWtXZLwqqTcKaAK+mKoL4vA/W7
	 fKqIZkdfM6nVPXHj8nv2bZGpuV9XijHq2PR6d/Qjdfm4j2npCjxr2klaUHfW80Zn2z
	 zb+Mw0XWKTZug==
Received: from [192.168.68.115] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CA419783DF;
	Fri, 14 Nov 2025 12:10:44 +0800 (AWST)
Message-ID: <580b0c6d979a69ea0c4590b5d9ba035b417effb8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: clemente: add gpio line name to io
 expander
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: kimi.zy.chen@fii-foxconn.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	george.kw.lee@fii-foxconn.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>
Date: Fri, 14 Nov 2025 14:40:44 +1030
In-Reply-To: <20251107-dts-add-gpio-to-io-expander-v2-1-585d48845546@fii-foxconn.com>
References: <20251107-dts-add-gpio-to-io-expander-v2-1-585d48845546@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_201047_795059_3BB32E6D 
X-CRM114-Status: UNSURE (   7.40  )
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

On Fri, 2025-11-07 at 00:58 +0800, Kimi Chen via B4 Relay wrote:
> From: Kimi Chen <kimi.zy.chen@fii-foxconn.com>
>=20
> The chassis power cycle process requires a forced shutdown before
> cutting off the standby power. Therefore, SCM CPLD adds a hard shutdown
> host function and triggers it via the IO expander in Clemente platform.
>=20
> Thus, a new GPIO line named "hard_shutdown_host" is added to the

Most of the Clemente GPIOs names appear to be styled as net names from
the schematics. Is that the source of this name as well? Or have you
somewhat arbitrarily chosen it? Can you expand on its importance (e.g.
wrt userspace software)?

Andrew

