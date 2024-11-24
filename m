Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B80D68BFE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 18:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOK9Ar+gSLtxcy1J0buehxEhQ4lOawQCp1a3v6MTPSA=; b=w0fJUbA6whY5nG8R47Ha+8tmZ0
	fyLUNF3HLtz0N3ELqZBrMg49HZTecS9lFjZ5oB4209EUI8hL4puWT9n5cwa4jNVokMxnT4bkkwSxw
	LCQHUottTnjnhs2gsGcgD/Qo7A1A1J77OizwhiE2K+5dwGlNQt6Lw9B3/lhx+g62FXOXCT9JTfsKI
	eM4O9Qmmgpi58A5SmHCo4iXVgXgSQA7Gz/Zg9U6MTlffDtscQhynbMTZzBFB2adU6NOwInJLOeQ8l
	raQxKZ1WIL9e/E+Vh/WIQBeMxUm/wNITyDm8CkyZuFU/68Ox2FURbrgRxvywkOiIfCipj28Vcm8x3
	dx4mlZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFH1F-00000006Tvd-1BUc;
	Sun, 24 Nov 2024 18:07:37 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGwj-00000006TNP-1wos
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 18:02:58 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id F3DA9C0005ED;
	Sun, 24 Nov 2024 10:02:55 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com F3DA9C0005ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732471376;
	bh=/2cY9gzo817mB41fvzRaH6gWD65jFTEbyCXf5Xisr8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eX8VceSo/s3qUvA1dEbDZvcu65yNUUqGpCWj1AJvWVoYTWlGHIvhpI2qjdrPlCl3K
	 DB73wX63Ta3YW5CTkpcHEZvcIuMv1i3X2fhVnCC/vn3yQoScwEoG289cNBF+29Cd7O
	 ZLXUEorjAES3Gn4R2MSnBzlk4Jw6EpAmkBExq/Qs=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 944CA18041CAC6;
	Sun, 24 Nov 2024 10:02:55 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: meraki-mr26: set mac address for gmac0
Date: Sun, 24 Nov 2024 10:02:55 -0800
Message-ID: <20241124180255.719987-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241021015147.172700-1-rosenp@gmail.com>
References: <20241021015147.172700-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_100257_577366_12E2C347 
X-CRM114-Status: UNSURE (   9.28  )
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

On Sun, 20 Oct 2024 18:51:47 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Currently this needs to be done in userspace.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

