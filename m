Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39581D6AB10
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 22:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvGayACEJU4xZaCyDpXN/VojcybBx3f3mO3hhbOOrb4=; b=0t9GD/0hHxBet2S8DEFzP0Dz0M
	I0VqiII/ebpXPTgeEmMnY4XL8KjkPm2LWrgSYTQyhiyN6T2sVTOipDcrW0t4CV8lOB0AueI0z3gMK
	1Xiv+szxziNqdbrVJ8pUUFIHz6IgVpTyqFABySA/dCC9X1fxypPL0UlGYZUet5OwSxprnsyBeyu+O
	VQKwzefdbqjMMdvD7oSNT7Xk19rjDUsKiC9N3Irm1OkWFsBpDJtAac6yz5iwt6F2K1ZDBGueW5Zzy
	XJUbpp4FqMZ5LnWzeFuqWDAvyt8twDmXaEnHO0O10Q5s62gZkYcyr23cIuK4kxnOy+oVZoeCqBBWq
	jhj2Yzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8QwE-00000000uOp-0BO3;
	Thu, 02 Apr 2026 22:54:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Qw9-00000000uNW-3kAZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 22:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2912444218;
	Thu,  2 Apr 2026 22:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB059C19424;
	Thu,  2 Apr 2026 22:54:51 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 2CF801812B5; Fri, 03 Apr 2026 00:54:50 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, ulli.kroll@googlemail.com, linusw@kernel.org, 
 Khushal Chitturi <khushalchitturi@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, 
 m-chawdhry@ti.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260330110135.10316-1-khushalchitturi@gmail.com>
References: <20260330110135.10316-1-khushalchitturi@gmail.com>
Subject: Re: (subset) [PATCH v3 0/2] dt-bindings: power: reset: cortina:
 Convert to DT schema and rename node
Message-Id: <177517049015.464276.4179544371896712365.b4-ty@collabora.com>
Date: Fri, 03 Apr 2026 00:54:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155453_961948_A41A239E 
X-CRM114-Status: UNSURE (   5.92  )
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


On Mon, 30 Mar 2026 16:31:33 +0530, Khushal Chitturi wrote:
> Convert the Cortina Systems Gemini Poweroff Controller bindings to
> DT schema and update corresponding dtsi file with new node name
> 

Applied, thanks!

[1/2] dt-bindings: power: reset: cortina,gemini-power-controller: convert to DT schema
      commit: 64a97c98f93e344be00d4ff10fef4119973938bd

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


