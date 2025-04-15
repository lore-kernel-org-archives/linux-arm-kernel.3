Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63561C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 03:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7CFb5phcuP+4Gcly1e9n0FZCqHTwOwFBeLqSWOYM5s=; b=4oZ10JZvNXzD5ZqGzPieExvVQz
	OQghfwpMw9zOeSjR6IiDZsLKLOS36amSK6l6hYrpsNdKpvADGJ2/RnC2QPQx7ELp2fUDcb9rYcdkT
	Q7hE9LUcdXsrSiBqY/eY9mCYNky8t3BeZb56Go+WqGIjNcffw3b4jtkBomBuRDuSvOXLLCsC658bE
	FyjlSLNEwoGrNuZhVoOnBHTHNurS4mPXRCQh9lWHf14ZwdZXA6KLSwG5fTxVqe0zPQWmz4qySrmLZ
	+jJhTKLuido3iMgqa+esXyojQR7iT2qiX7cMhfeZqnDkAoANVPKvi9s8x2I+XShC3qT7NcjEc6DPG
	YaIR7Z7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WZM-00000004Gdu-397j;
	Tue, 15 Apr 2025 03:02:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WPp-00000004FJ1-1PyZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 02:52:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D68BB4A5BD;
	Tue, 15 Apr 2025 02:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA257C4CEEC;
	Tue, 15 Apr 2025 02:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685566;
	bh=PQn6OeimQolU3wGoTb/bxlB0yG4NJSd5Q4MyaSlJeyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XAOLADc98F4wRQxP38j7hllxw6z+oKU0P/qhhS0ykYZX5vUJxSJ1P0pMVP6GTg4sI
	 YLxezJtqqOE/jdpflIcxpZ89URJPHCzC94uXMSTwJ2E57oEoFAHeHK/wWCrQ1hPi84
	 E8MIdvAggc7p/tMtl0n3siIWbn4G8RR7pD+d07EBNKh7r8PAacl3FrLluyTDeirfmP
	 m9KUAk6zszj5ZwkHZhUM9fFzNHCB8+fBOytNjDBP5NZeqqqu38Roj4EBGr8l281rAK
	 zDQ/AnhNmE07F/bYVFnrfxJbANw/uUPit2QsWQ8IKFByrSfYRUO+f1f2AOcX9YdD2U
	 6wyO8wXmoJVDA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: remove max-speed = 1G for RGMII for ethernet
Date: Mon, 14 Apr 2025 21:52:39 -0500
Message-ID: <174468553408.331095.8173023900653725550.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>
References: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_195249_399539_66D7BD1D 
X-CRM114-Status: UNSURE (   8.51  )
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


On Sat, 12 Apr 2025 15:22:40 +0100, Russell King (Oracle) wrote:
> The RGMII interface is designed for speeds up to 1G. Phylink already
> imposes the design limits for MII interfaces, and additional
> specification is unnecessary. Therefore, we can remove this property
> without any effect.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: remove max-speed = 1G for RGMII for ethernet
      commit: 0d5da04d23c3b398595727a274887cb8ff1c06a3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

