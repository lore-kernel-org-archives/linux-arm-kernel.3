Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FA5CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5Dx2STIssEWMZ2hfqgjVJ+xIHEWlbWL7uJdTC0GAGE=; b=AnqsY1Vic6CdLBMc4v8mG3Zo1/
	RzpLPGhxYY/sRzszyLLlt3S5x5hKY5qUgTHEQrtriALy2MsRzn/JJyyFO84a9FIAw6sX54X8QOFsp
	6mv88S+1c4rNFouICZv0OYmbD5TYL+R+mbYtoKaR4NMlYnM0Vxjon4R1CJTNobXjFDLo8+r9rzmTE
	S5oxQ7iLeGeDmAvLtxPvJRT26Vxli+nbdq2pUzZm6mVl/Qyx/63fJZqR8wTUqgmCkMSEcWdUCn2Pg
	mvBlcBOg+N1bgILltleqiQrVhhGEJZa7bWlRUl22pmDh8DcN57vlwMROFg5Jolob/q5SL0u7+8x3v
	Ud24oVDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG4b-00000001Jtf-2y20;
	Mon, 28 Sep 2026 18:27:33 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG4X-00000001Js1-3ssT;
	Mon, 28 Sep 2026 18:27:31 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id DAB75C0000D8;
	Mon, 28 Sep 2026 11:27:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com DAB75C0000D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1790620048;
	bh=VIe98qGS62Bptvrc67/xbYtt+XNucl3ZaHj/83F/Wfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qABasuEKAeJ6pGS+sCb4CeT+UL59sq9annOluwd5/TNPE9hVQW/siLc+TXuTZEZAT
	 mQYmZu0R/gHgVNpXOK9TBIoWme/23jnDkOfsCSYyQS4jBiY2uPaG87RaiA/DXv1JBg
	 y+zbzY3afRqVTF0G+rS4c9OxLxYzxeM06rzZczMI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7F0CAACC;
	Mon, 28 Sep 2026 11:27:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm: dts: bcm2711: Add emc2301 to the CM4 IO board
Date: Mon, 28 Sep 2026 11:27:28 -0700
Message-ID: <20260928182728.1268880-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925065418.2248731-1-pbrobinson@gmail.com>
References: <20260925065418.2248731-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_112730_408986_BB75BB66 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 25 Sep 2026 07:54:10 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> The CM4 IO carrier board has a emc2301 fan controller. Add
> it so it can be used on the CM4 board.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

