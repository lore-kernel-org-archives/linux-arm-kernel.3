Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C2FCD8CBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 02:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUQzdVCI9Ss5QrwdmvciMMLlU7W9sG3oUSRRxCeCzFA=; b=1VHzM8XxNtKlQjmqHMB8/j1mxe
	CPnYfyCeAW9G9hXojGHnMu2JcdmCV6cg7R7LRY0h4Soj4nxpC16F94cOHnMZMe9VOpMIWqa7uBzRM
	Xv3t27wjDvc8Oo9YRJcOBYDggF4tf/ETYEq/drZYxRgGJzdPZuk+aYu5LlsDS6jSF/vMEkbLvgwbq
	k7iExJ4rfcXd807xDdkmi18gUjPrHBhERNU4gnEF+0Zhdi/IUPAEsBT5gJ5fY7hhE6G9KPFl2sGdL
	qJJ9KV6E6Mmbj7PtDCjXiVGQhLyvVZ30OXhHXVfDI5ZAvmCl5rwQs71r3QBMwdVQUdqCs7p2JVvAA
	PgpI5WQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjKp-0000000BPUi-3kiJ;
	Fri, 14 Nov 2025 02:14:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjKn-0000000BPTm-0ifo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 02:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763086476;
	bh=EUQzdVCI9Ss5QrwdmvciMMLlU7W9sG3oUSRRxCeCzFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gNZ+N0XWNfy4GRAH3j2k0iWaIimQhH01+1GtLcyY+mWhCAySKtgMOKEclhZtNVpPS
	 +3B3lxVwFHV8hDUCISyuFBVOe/juAEY2CZ1NGb1RqvSuGrR2KyasVPOg73eFOMo0tr
	 wSv0wg6ktaTH1UVG8/6PvZWK2cG03AEHRii37CF4C5LwcuLNNvLAXZItkE8RcEhOY7
	 L+1Q9tW4K+lN0BDG1lCSU6AykWuh0bn6hLPnT1dB/3wnxURSR3FinUV+1eF0zq6HbC
	 deMznNYI8qgdemk4EfZy+Oyd3ueLdz4YeBWqRuTDaW1PJYPbSSrBzd5l2Oh4CSAILN
	 0sDk/nOXbVv+g==
Received: from [127.0.1.1] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9B568641F5;
	Fri, 14 Nov 2025 10:14:34 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Cosmo Chou <chou.cosmo@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 cosmo.chou@quantatw.com
In-Reply-To: <20251018043310.1056032-1-chou.cosmo@gmail.com>
References: <20251018043310.1056032-1-chou.cosmo@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: bletchley: remove WDTRST1
 assertion from wdt1
Message-Id: <176308647425.812008.7414923561320240836.b4-ty@codeconstruct.com.au>
Date: Fri, 14 Nov 2025 12:44:34 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_181445_410149_A766C463 
X-CRM114-Status: UNSURE (   9.53  )
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

On Sat, 18 Oct 2025 12:33:09 +0800, Cosmo Chou wrote:
> Remove the external signal configuration from wdt1 to prevent the
> WDTRST1 pin from being asserted during watchdog resets.
> 
> The WDTRST1 pin was originally configured to reset the TPM during
> watchdog events. However, the pin is incorrectly routed to SRST#
> on the hardware, causing unintended system resets. Since the TPM
> is not currently utilized on this platform, remove the external
> signal configuration to avoid the incorrect reset behavior.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


