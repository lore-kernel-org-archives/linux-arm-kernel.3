Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FC6EA854C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 03:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vZXs/Amiz9wWEOx1f0xIKWGcAuGB/QH1ZLN8g6Wslk0=; b=ptvi5FOdk+op/3KaZEaR+3oY7v
	9hpMJNlbtmnIRDrO2XXWrLB4kw8EZU+ISC+7DsY7Bi28gSzuV40o9AdQ/D/Ou7iGC18aHx7tTUhKP
	v0Z2VGn7tJU2juWoK/I7UcZyB894J62q/AHEkhh4lSCPVmQoZ+t1YedyBGncjHDoIMJKEZbB7YWr9
	pv8Vm9Pt1BUkao6LhkX963/nrHzQTuk4b3d2CKMzp0ECFSYr3ddyicnifuXLPC7sZc/RK2oWxgaZ2
	UN/oTBD85khdBElwCwWljQwDgHEYgM2HTWbQnMQjg6rw3z0+jsDtQiaJIQ+3usX3LiaPfDivIVFEh
	LMCR4KZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRJV-00000006b7h-0Zkw;
	Mon, 09 Mar 2026 03:29:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRJP-00000006b4O-3DzK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 03:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 54DFF433DD;
	Mon,  9 Mar 2026 03:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A4CEC4CEF7;
	Mon,  9 Mar 2026 03:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773026982;
	bh=GaoP8wcFVTkbA0qAqdRsL25+1PTp6d7J/ewviONVA+o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dkfi2mk4t3JAolTuCkgrASkFRIEnwyTKbECop4UEOr2WwDuFqR5bZyD8xNfO8tZjT
	 Amhs1faU20RdXe3I6YSEyLysbbNCDlmoX1zZhgy2U3FvtVop73QEGXEhxAzpdXXIp/
	 gS635NNbqE8v58IoF6vXIiiK5PcBGKa5kp6Tjg+MBBQ6eY1ChzDc3BHZElGZPWQUOo
	 1Zu19V4fGO/ch/olguZ/5vTSDSj7L1Xp3JXAQsTuznFwae9ptoBaD+xkU9Ek0FuGFN
	 AT+F7JAnCW+OAx7iyOescsNFhuIUXFh8bXC5y1d3e39JAq2lKwzz2oXYbk/s/ABbto
	 Lr7xUiB9paYLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178C3EA8525;
	Mon,  9 Mar 2026 03:29:42 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Subject: [PATCH 0/2] ARM: dts: aspeed: anacapa: add eeprom devices
Date: Mon, 09 Mar 2026 11:29:26 +0800
Message-Id: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v1-0-45092310e0e6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJY+rmkC/x2NwQqDMBAFf0X23IWoKLS/Unp4Js82h8awKUUQ/
 71Lj8PAzCGNltnk1h1i/OaWt+LQXzqJL5QnNSdnGcIwhzFcFfbW9GmKVsmkKIioUKSkZLXNrWc
 iFT2wMMwYp0U8V41r3v+r++M8f8Xs9lx6AAAA
X-Change-ID: 20260309-arm-dts-aspeed-anacapa-add-eeprom-device-a1aabe06a35b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 carl.lee@amd.com, peter.shen@amd.com, colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773026981; l=628;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=GaoP8wcFVTkbA0qAqdRsL25+1PTp6d7J/ewviONVA+o=;
 b=kgrps2Go1O4NvQWUFzsxLNEgYXY5NUMhGVNxD99zrowxmzORxAcbs5rIdv1EZnF/n4UTaLfVN
 vEF+OVFHqZ9AJqv/iM04dPXj3sUtCJWN4uWI6C3XLSaA+E4Ohews4Aa
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_202943_829608_34C4CDFB 
X-CRM114-Status: UNSURE (   6.23  )
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
Reply-To: carl.lee@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add eeprom device nodes used to store FRU data for the PRoT
module and NFC adapter board on Anacapa platform.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
Carl Lee (2):
      ARM: dts: aspeed: anacapa: Add eeprom device node for PRoT module
      ARM: dts: aspeed: anacapa: Add eeprom device node for NFC adaptor board

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-arm-dts-aspeed-anacapa-add-eeprom-device-a1aabe06a35b

Best regards,
-- 
Carl Lee <carl.lee@amd.com>



