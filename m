Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05979CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 05:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMKro1feHta3Ev1l0OElUNRw/Zk/TZv7q1l/O5EtEYo=; b=TTy/h3Zd0ECcOVtW/P/JS3jPcd
	fvHsc4MIc0jw23X87qL7DmKSnaOxdTux1e473s/W+y1ytC9ob9ftc9Ey/GuBEfJmrRBgzms/S+ZWG
	GQJ3agXCYULTiOz7Em3s0jXo84DkTwmgin1PGByWG1vRGBqeKbYrgWFJv+O3QMp83bykmyqPOdH0A
	tWb4sg1BtanMeMGw4VBslbqI3t/pFd2oB3/B+ELH+tcquwVRExyKSbB3X/94chZNy4EgnRzZVts+2
	2RS6/NTLDij9kEvkn+OQdC/go/h4dvMVLF4q87yW5IdFx22cNvT1eKA1Np1C/iKlGl/5jn3OgZmqu
	uzZckpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9chF-00000006a5t-3LJu;
	Fri, 17 Oct 2025 05:08:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9chD-00000006a5U-0Jnr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 05:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760677679;
	bh=lMKro1feHta3Ev1l0OElUNRw/Zk/TZv7q1l/O5EtEYo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OGM95IMBtiyOqcKal/dEideDcepT9sptwo/Xw+NOzQRmzIeUAnshfynJtDxc/7ZjF
	 nMlpFLYjQf7BOPFIN6EM8iyvPrzAvcOoUEZfSv1dags2cyaDA8ARoVoWaqwLK/I6ma
	 GjKL6et/Lgff6UDz+wX3FwhCda7jyYx0SAkZSd1rPyVBIYYlk53HlSrEh3hOPq7xh3
	 JTT+ofoadN30UyYWhhUq8umhJwRwueq138SpWZ70fC5fS2KMpz6U04RIu6i+aLMczo
	 X36BvXTM9J+h/NjXtcQcJA2FeusqtxyNrgwMn6elhj4RzFxNdIkmgdAjVEiXAdcyMn
	 ZUolDo7r0o7mw==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60FC0766F5;
	Fri, 17 Oct 2025 13:07:56 +0800 (AWST)
Message-ID: <a96786b9020ad278fbda8c2007ad1c98ca41a4a7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, Leo
 Yang <Leo-Yang@quantatw.com>
Date: Fri, 17 Oct 2025 15:37:55 +1030
In-Reply-To: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_220807_323031_C3F7787F 
X-CRM114-Status: UNSURE (   8.79  )
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

On Wed, 2025-10-01 at 16:47 +0800, Kevin Tung wrote:
> Summary:
> Add device tree for the Meta (Facebook) Yosemite5 compute node,
> based on the AST2600 BMC.
>=20
> The Yosemite5 platform provides monitoring of voltages, power,
> temperatures, and other critical parameters across the motherboard,
> CXL board, E1.S expansion board, and NIC components. The BMC also
> logs relevant events and performs appropriate system actions in
> response to abnormal conditions.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>

Thanks, I've applied this to the BMC tree.

Andrew

