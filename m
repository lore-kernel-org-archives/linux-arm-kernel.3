Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0868CD5854
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzXNokDpMq9yO8xbaN+ULDk+bKhztegLiSF6Ymlxxig=; b=hvSOaLv6owUT8AIbFEM/5Pq7zw
	ZqlZEDSknc3PM6OjMmVGmxoRgYicG0c5tyEKLrM6iANqGbpf6NSYGgmiAALJg6LJWaQI/Ik9coD9N
	qDT3u4cG8vY718SDJ/arAdZ+/X+CWWeqfehfF0ITsAuZ/WIU5LC0rueHVR5x2dFAfcWsc9UzYDbqQ
	DfTayq+iWAZjDVT/Mz9DcS8L3j37Dj31rzp+6K2UAEW9uLfK0a4EBxOgz+KVVpUndiFjesIH5K2rK
	4OjOfkL5JTnjD5MZc4f7YXzGkIBD7YZ/9g4pUJC8sQFXU803afd0CDd05tkaSjKBtYpZZs847sW7C
	nxbA2ceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTO-0000000EnDF-2zb9;
	Wed, 07 Jan 2026 11:13:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTF-0000000En3U-1QS9;
	Wed, 07 Jan 2026 11:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767784369;
	bh=U0pEX+LelAq23mmJLFCvPYrRtCMIXpGEMNsR7cPAe1g=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LZssPx5ytjvdAP1hY1asW0B/erJMT3v++ngxlrIxHAFmNzjDsh1U4tN0TfCXvlwqz
	 dqGbWEXNH+BkTE7bBwL4EVWTaQBtvKbRQz/5XuUKx9be1hmeuFQDGkfPxhV3h/rPV4
	 BD2Oo6AhaFelVZtR474ThdxqQYGen3+UQXVbNskvVpEBAewsug48CPzLp6DOA5rsPI
	 2IqphSf/NhMFSxEydzcnFbyucFbObJ38yZ2iA70SVpOvysG1tHwpxI4MNzRfRT8vnV
	 aS+04J3P0aS+6vMhcTXLJdX1sxEkWTEFKXjbWpTNuSsx1VNiz0gbrSz8e5wgqrV761
	 uHrC8RM5NdWrA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 249C517E1340;
	Wed,  7 Jan 2026 12:12:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223152523.155523-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152523.155523-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: airoha: Use hyphen in node names
Message-Id: <176778436908.39195.12833861892642524328.b4-ty@collabora.com>
Date: Wed, 07 Jan 2026 12:12:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031257_560010_FD334CD0 
X-CRM114-Status: UNSURE (   6.60  )
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

On Tue, 23 Dec 2025 16:25:24 +0100, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> 

Applied to v6.19-next/dts64, thanks!

[1/1] arm64: dts: airoha: Use hyphen in node names
      commit: eaada4f56ab366f4c198291aa9d04b8a3348e291

Cheers,
Angelo



