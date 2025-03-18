Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361B8C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Uux13IgspT+alznO48iV1IYcYe60S35fw20xoq9QFw=; b=BG7O4ygxScAyvgJbDgxAr9pvSY
	zye8oTFNHqrrjmcNXouxey5HGhsKG26LDebuc1AGIry/b0Ud4h2TrD4eiNvT/nbLN/TwDBDX4zqhs
	mF+r7pI5hylRJKbC8MPrHt863nHnszLQ7Vz9ijc9LiwayveEgn3bnhqbzg1WTZAoP44gtxmdmN22O
	H8QGeNc0UuJlrbLOu6JSW9QlArp4hbAfpSFf9rn4ETnr9PefXOAvPzcwYh78Ewu6EmRcjrjM2+yRu
	IN8A49TJgKAVZvVnPA4iLaVhNl0uvTfdj1Bu8t9M53h32LnUss/ol39zPiHJdT/KjRDMsaWnKUDSu
	quVQDUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYDO-00000006E1X-1b7i;
	Tue, 18 Mar 2025 14:46:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY6C-00000006CyE-2L7Q;
	Tue, 18 Mar 2025 14:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742308759;
	bh=GisOJD1TXdv+jG24Ahwf9nT6eMF5RJa4fPp5r1uc6Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WoE14fUJZ6fME93bMNeZXwEKFpbI5E49q1n+St6f/Yv66ougqdVwgdLF45oIe1c1Y
	 UOL1s95gHnX5wxp39zjsATuqXfQkMW1BBoD84kULqDhESIvsKE9J4VaJRb1hgfmHs2
	 iBiNTrHBkx3ssyJ9fRXkUt8xm5ryvqBFcy50EByUrdcnLWnfC5LRuP2N328cGBNHtN
	 1bC5jGezSBj+e8anturw7+FEE0kDKnncPzdGXeLyjLrhuHRoYp8AhcRClT6YhsJSBw
	 +CmzTxwoO1jwwVCaSWq35V4e2SzXhUS5niGApmorJSMrtoMeR8umoeuD6SsyS1twXo
	 DWUELs2Ci2Swg==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCF7817E0B25;
	Tue, 18 Mar 2025 15:39:16 +0100 (CET)
Date: Tue, 18 Mar 2025 11:39:14 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	bleung@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark
 trackpads as fail-needs-probe
Message-ID: <f80dfa43-74f4-431b-934c-e103b8204276@notapiano>
References: <20250318102259.189289-1-laura.nao@collabora.com>
 <20250318102259.189289-3-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318102259.189289-3-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_073920_736642_DF3EA6DD 
X-CRM114-Status: UNSURE (   9.51  )
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

On Tue, Mar 18, 2025 at 11:22:59AM +0100, Laura Nao wrote:
> Different Spherion variants use different trackpads on the same I2C2
> bus. Instead of enabling all of them by default, mark them as
> "fail-needs-probe" and let the implementation determine which one is
> actually present.
> 
> Additionally, move the trackpad pinctrl entry back to the individual
> trackpad nodes.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

With these patches only the right trackpad is enabled on my Spherion and it
works as expected.

Thanks,
Nícolas

