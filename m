Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7B7E668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13VId754soKJjwqZkO5/47lv8qV/kIKhgKEVy7x785k=; b=n4Phly8K2qX1buB4L+IgjMLoXH
	smQ4NFuiNz8lsmoG8UMPtJwQYFRwDtay2i2AwXHfmo55yCIK3n0OD6LFLos0iSsN3Ev+Co5BSfcZ1
	iP2TpWdmYUDpKJHET4v09dVROaxEHyyG0TV/t5mQjV3FewzoAjQngdXNoAsIUAF6pNfn5EdxnpwvE
	LDeXrq6jocWKqsfFAI6jzxEl9yJC54kwSNruhPw1pDzZTJLBHFVGCT3pxrVcbBipxkbC740wOAdaX
	P1UWA9FcttzbKf2pHbTRIm7uJaH4cqVhQyE+mNSPaNsqYI32YKEsKFpE43V2oCYQdwgi7XjF3rg99
	UuQFxtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGgS-00000006RCo-2C2k;
	Sun, 24 Nov 2024 17:46:08 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGfV-00000006R4q-1B7a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:45:10 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7EA38C0005EA;
	Sun, 24 Nov 2024 09:45:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7EA38C0005EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732470307;
	bh=naozf7B+svGSZsTQ6gTWOETT7Tz1OxiscnzlD5eNm84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O14rHKNVZFLIepu7TlBhUc/iugDhVfJBCdG7qn5Bnfcfin00XUBRfIxTGdZJ2GHyl
	 m4juPCBf0B4BaOSHylpdRWYmaO1ZWspksVb+tx11WsLeeP1bMRX/cqRVljcZDlpok4
	 0Hw2LkTGvooKRugYd0ijF+DLLtPGS7QyVQLilXTM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 21AD518041CAC6;
	Sun, 24 Nov 2024 09:45:07 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: broadcom: Remove unused and undocumented properties
Date: Sun, 24 Nov 2024 09:45:06 -0800
Message-ID: <20241124174506.716145-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241115193854.3624123-1-robh@kernel.org>
References: <20241115193854.3624123-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_094509_427781_20113EFC 
X-CRM114-Status: GOOD (  10.00  )
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

On Fri, 15 Nov 2024 13:38:53 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> Remove properties which are both unused in the kernel and undocumented.
> Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

