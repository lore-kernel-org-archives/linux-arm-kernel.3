Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064E7E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C6bL57adFb/Njn4uHuzELUQOZ/2wxPeBeKrPq7LNcE=; b=vTTZ9S0pLfZ0It3VM7Nlyaa5OU
	ptthBmG7tvBojbNm8aHHm+nh54jAZOZKdJ66j6CgR7tzAvNjAAmA8jw9dbrrgbt9KWHVQKBrE9HqY
	x8VJm52sGG7dofOwUj9j7M4qMG8L/dlJhCYiv8Lo+O1ANI1ugY4RJz8gZDcF1bn2K6AVl5Lkro8PQ
	99Qkq3LP53Xgie82ql5teTYRYRw6L9phgrSVOVYoeXwIkkUeAc90Pm9j/k0uDl+OBmgYvdRd4h8+F
	RCh6w1SYqtc/sWUWUP64qJrG2m4mxx6veipWfRVKNPvhO3n2Ua7f4uxSPYgX0j7nM1Dqat3Z4exKa
	XOuhaGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF4x-00000001iN7-35dF;
	Thu, 19 Dec 2024 11:52:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF3q-00000001iCE-26Tq;
	Thu, 19 Dec 2024 11:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734609081;
	bh=alevm6nONFx1W8mEJCqPhCyvf7gfMJozxAUbfdxdfbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eT0koG4GHdQpnxWTe47StLj47weqr9q2EubmqLp9hGXopQ3Zfm9Dhqq2rDyIVO/7H
	 HG0vDb0vhJWpkE7OQqjzFVN3WY2zj7QDbJ7fG4xEIneuRjCPAqe2XnkYvs2ZGOz8JA
	 6wrd/0Mx57BenQXsV8yXMIBB4nS9nXMrl40GxBQCFMU0kPiYPyVtKPAR4dPLsyKM+J
	 5bKo4OwcuVcyVRNxJ17PpUpj5fj6DP0hZeE71+wxAbo8ed6qRM+Iwuqizs52RqU+U9
	 CmNZ0mJephvlhNYJjxacn18GZ8MFvCAxopyy4YZQFbXTh5fg/7umbvgQnFaAMkSzyL
	 IFa2aGO2u7OlA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 977D817E1524;
	Thu, 19 Dec 2024 12:51:20 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20241206132401.70259-1-linux@fw-web.de>
References: <20241206132401.70259-1-linux@fw-web.de>
Subject: Re: [PATCH v4] arm64: dts: mt7986: add overlay for SATA power
 socket on BPI-R3
Message-Id: <173460908054.53645.11475281075607913939.b4-ty@collabora.com>
Date: Thu, 19 Dec 2024 12:51:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_035122_689065_443807B5 
X-CRM114-Status: UNSURE (   7.74  )
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

On Fri, 06 Dec 2024 14:23:59 +0100, Frank Wunderlich wrote:
> Bananapi R3 has a Power socket entended for using external SATA drives.
> This Socket is off by default but can be switched with gpio 8.
> 
> Add an overlay to activate it.
> 
> 

Applied to v6.13-next/dts64, thanks!

[1/1] arm64: dts: mt7986: add overlay for SATA power socket on BPI-R3
      commit: 312189ebb802a0242639a9c628cfdc6e532d8e11

Cheers,
Angelo



