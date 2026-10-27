Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8818606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rHv/kTGn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FmxUwmAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hcVetJ3j4Yw0L4vaeF4Sin3e+Kqt87+IIjhgJbDSvlc=; b=rHv/kTGnylyf4FhFFAwI4eTptE
	sFz6L7+J3blAywmcmd6N/oXSGApCJ4et1z5L7oafsmaJlqe0mmN6AVhV3wbJzuePgN6btNxUpZqkI
	i0B0fBmu8u578JTyA8+v4UWJlf14ScJgFr0xZgyKUUBvB4wkkbKc1r+C6pNPMWsT4575NV49NSaWd
	Ln891CwQTHKdoXHInXQvfvr6AxC5jFgC6VixP8fCV/a7ZSPMUNwbao1mimoJ4OiLoQp0SkmzsQLDi
	mig30rawue+hTWoM1VASbm+KMrDtnJ8jbJRBcnlirb494PPtjamH26LZF0X9fp8dNdDi+nd4FcMrG
	bU8v68kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj53-00000005AQ6-4Aix;
	Tue, 27 Oct 2026 15:27:18 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj50-00000005APN-0HK8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 15:27:16 +0000
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id Lc6Fx7S4zLvgbLj4yxvD4m; Tue, 27 Oct 2026 15:27:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Lj4xxQgutnXJHLj4xxIIRt; Tue, 27 Oct 2026 15:27:12 +0000
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=6ae0c2d0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=xkLUNt4dAAAA:8
 a=zk4-lHRcAAAA:8 a=X3a0BiUdAAAA:8 a=_jlGtV7tAAAA:8 a=OpKgjLFNguK3uynLL7kA:9
 a=CjuIK1q_8ugA:10 a=A2EApc-QTtVVSfvlwUcc:22 a=7cv85riZL9-k45RWW8P6:22
 a=aWu3muFgq6otJbhCXpL5:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hcVetJ3j4Yw0L4vaeF4Sin3e+Kqt87+IIjhgJbDSvlc=; b=FmxUwmAs7mF4dF4b3MQBl8bdVb
	tiCn1dYzKJ0/5zMuy3Dkl5KtJ1CdWrSMhaagLq87Gx1uPeduOFJAZZReNPm7krFrp0E60KhUlLIDc
	70bByHiXUwq6iK+SuZfP+qFgtQERObuDjcXRMpBCSrAB+a4BQNBCvwyL7kA0dqv78KyQ6qQWLmyRA
	Hq42mLTB+P7mkwhAHTZEbxhOIJ8RQ+dr6VZLeMOToBzgTx990t+r2R8igmo3YeZYI720aXTIoEzEs
	LnG2PVoLpX07aKgbwkJl8Q9l2uD8LdzNHoRsOylbfZGPe9Q4HIZozVgI9EWjY8N/Ouib2/Lj2x8ET
	IhcPGRCw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41180 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLj4v-00000000Fjr-01VO;
	Tue, 27 Oct 2026 20:57:09 +0530
Date: Tue, 27 Oct 2026 08:27:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH v2 3/4] watchdog: da9062: Add support for dlg,wdt-sd
 property
Message-ID: <2365680e-3319-4ee1-90f4-33041e8f701b@roeck-us.net>
References: <20260924065044.368341-1-primoz.fiser@norik.com>
 <20260924065044.368341-4-primoz.fiser@norik.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924065044.368341-4-primoz.fiser@norik.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLj4v-00000000Fjr-01VO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41180
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 25
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO5ur8AFF2lzAWyDmG/o7gGrr9bD2i67wiLJoYbXCXqkOHZ/935mP3Kd7gjra7UTXXCXM3oLgJNtssMWeipT7YVW1exkz4vHQVkrDl7YVS4vnLnA5lL5
 dweuqFY60objfSswiyxF+qSKTU29iEIyteDhTulXfdh3/Ul4tysD92A4t3MlYidFNCY0lYVlXyH5RQ7jF3UDnoZUt4hIxgJbGjP8b+27Nha7lUjhwj2UvoP/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_082714_224292_70462B03 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 24, 2026 at 08:50:43AM +0200, Primoz Fiser wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Implement a method to change watchdog timeout configuration based on the
> "dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
> SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog
> timeout.
> 
> If no devicetree property is specified, the WATCHDOG_SD bit stays in the
> default configuration, not breaking behaviour of devices which might
> depend on default fuse configuration.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied.

Note that this depends on the mfd patches making CONFIG_I writeable. Those
patches have been accepted but are (as of this writing) not yet upstream.
Assumption is that both this and the CONFIG_I patches will be applied
with the 7.5 merge window.

Thanks,
Guenter

