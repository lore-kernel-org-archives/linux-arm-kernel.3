Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D04E66884
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kovJ6va/244Kd8BYCZmbUpeTwg+tXqxBakYcQ6bbK1M=; b=LLcOpBnsdL9/VAdIC4SyYf8+45
	jvQMy37yv4mGLQxOuGgqCEV/QCiLNMEpmczPD4DtglEuM7cY5OfHXVwEFlUdIPoQCNyVdYtbfhTE6
	ZcVkhl7duwJs6IL0su1aeBa9f2kJlHfFAqz/miHW9DAmb0pi6e3CdfmV1oJX8oqshh6ECc9A1lAkH
	VUjGjjzJNJuYZLRKwyKGuAC20ZdooPbKUGYv+Kdl8661/z247TU8nkHT84X2kI9xwBe0ItDdczN+p
	cEkwB/eOPg1loFKszTn3bWdMb6+JhLWvSQEyIe3BGrwfregvW1ecrvvO7cHvsD1Lz7CdJkmG7DGv4
	digSh/MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhIG-0000000AxSH-30lh;
	Fri, 19 Dec 2025 20:41:45 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhID-0000000AxRk-28Is;
	Fri, 19 Dec 2025 20:41:43 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6B375C00153A;
	Fri, 19 Dec 2025 12:41:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6B375C00153A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1766176899;
	bh=F6AvpRw/MS+EMd7zNmk9+zup2u4TQEOBAZJYKN+n5mQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hN3SPY4VMQFePNoId8up7rtjSG/XVnq48CvD6yIfl8w1JS1pagUq8WbAxhbObSU/f
	 D8U1UdEXDgAGWV7luud3TXbyRPx2yQOZKzEnj4XwvIWCeY3pMr5KCHoF+txcflBv/N
	 qYbT+0X0o/B2/O9TBKdz1mfhnhJXziYRZ/IKHPoE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 019B5A340;
	Fri, 19 Dec 2025 12:41:38 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: broadcom: bcm2712: fix RP1 endpoint PCI topology
Date: Fri, 19 Dec 2025 12:41:38 -0800
Message-ID: <20251219204138.1015487-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <827b12ba48bb47bc77a0f5e5617aea961c8bc6b5.1766077285.git.andrea.porta@suse.com>
References: <cover.1766077285.git.andrea.porta@suse.com> <827b12ba48bb47bc77a0f5e5617aea961c8bc6b5.1766077285.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_124141_864126_87383D03 
X-CRM114-Status: GOOD (  10.40  )
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

On Thu, 18 Dec 2025 20:09:08 +0100, Andrea della Porta <andrea.porta@suse.com> wrote:
> The node describing the RP1 endpoint currently uses a specific name
> ('rp1_nexus') that does not correctly reflect the PCI topology.
> 
> Update the DT with the correct topology and use generic node names.
> 
> Additionally, since the driver dropped overlay support in favor of a
> fully described DT, rename '...-ovl-rp1.dts' to '...-base.dtsi' for
> inclusion in the board DTB, as it is no longer compiled as a
> standalone DTB.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/fixes, thanks!
--
Florian

