Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA2DC88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqVXt31LO79+0/rE01UndB6JpscPweGQAa513BFX6ko=; b=NwS5myoUKMwns6oDq6YUT5VK+P
	XKL1f7Tfv1otpuiPtxCETyNJGNLGKa99tLoWHo4kRC0zSzh8/JUyv+DuS2OA/19CHkc7Vt/Cb98Wc
	mO7kr4gG3g5Ju7YtkT7NaeWpliP8pEmMXhscMALC3ol3Ri2y+UEv50qWQ9NLYassMWdWT2Vi5BO1t
	3z2I1UEuMb0SBDo1/wzHmHnnt9zERiSlFKU0c3Ikz6qVV+36QpbHks5W1hTgYaFUYC0r5++4tjf/I
	jHe3N2vOSjqvXCWRk7r+Jhm4yU1hOQnqNB3OIZsOt75nSh6IGo0B12oz5sp8ddgvJxivsYOi4joIp
	qFv4gKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lBY-00000001i8x-0WpZ;
	Sun, 13 Sep 2026 14:28:00 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lBV-00000001i8Y-1XrC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:27:58 +0000
DKIM-Signature: a=rsa-sha256; b=b2nxA8lkJz+ylAO3olfTufX8539NJ1KPfrZeno5qK17Rudx6PuyCXEq8FvzfR0y4hN9fQwbf2KVDi1ITRuPav9vQzriJusDTD3jNIYs3p5zVHv2jEPymHaurpTfa1m12UPo/Cyvp06gJ67FeCK+UtXWy/X/AvRU2b1Mh3dBuK9iLAXa3ceAt8a0qIPN3yNmw2p+0iLizCaM60sbwx6tHjznWyzP2ePDEBhaWFsf6vs4wxe74cPF34SAcYMGRuLu7Cc6RFVpEtK3YVKuDnsVnjC2DGSyTCZFXZEmSlnHmFFhubgEnQvBE/vzbXCM/Nz/IdQ7y/Z4OLnY5gOIDuJsHSQ==; s=purelymail1; d=purelymail.com; v=1; bh=Zj5EWEqAaCDZeeY56pguDf9MrushLq46Zr2FoXK63UM=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1692820451;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 13 Sep 2026 14:27:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1x5lBH-0000000FW2f-2czl;
	Sun, 13 Sep 2026 16:27:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor+dt@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Michal
 Simek <michal.simek@amd.com>,  Rob Herring <robh@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
In-Reply-To: <fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com> (Marek
	Vasut's message of "Fri, 11 Sep 2026 16:49:59 +0200")
References: <20260909182641.165383-1-marex@nabladev.com>
	<20260909182641.165383-2-marex@nabladev.com>
	<874ifwjff2.fsf@dell.be.48ers.dk>
	<fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
Date: Sun, 13 Sep 2026 16:27:43 +0200
Message-ID: <87wlspb50g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_072757_490200_D09ADAC4 
X-CRM114-Status: GOOD (  10.49  )
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

>>>>> "Marek" == Marek Vasut <marex@nabladev.com> writes:

Hi,

 >> > +	chosen {
 >> > +		bootargs = "clk_ignore_unused";
 >> Why?

 > This can be dropped, thanks.

Good.

 >> > +	gpio-line-names =
 >> > +		/* GPIO 0 - 77 */
 >> > +		"", "", "", "", "", "", "", "", "", "",	"", "", "", "", "", "",
 >> > +		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
 >> > +		"", "", "", "", "",
 >> > +		"ifm_device_info_eeprom_wp",
 >> NIT: The dts references a number of other GPIOs, any specific reason
 >> to
 >> only name this one?
 > The legacy userspace tooling used to depend on it, used libgpiod to
 > look up this GPIO by name.

OK, but why not add all the referenced GPIOs if you fill out
gpio-line-names anyway?

-- 
Bye, Peter Korsgaard

