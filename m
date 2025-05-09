Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159CEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxfKs+1nCnFmm3vuoMduvYVtzz6JNhK5bmZQhsTvCh8=; b=xGnfWL5ZGnRSnINSfi48oiYv/s
	Ad2onUxdHDjc8gVGEXRtGpwsHAiGgAEo8P4SmoYtFutNJzohljivE+y3PEeMG5BjEFaeMpbegTqiF
	0dOSbhtKGDGZdj23I0ieT5Mzp75Dqq+XGnw/sCpQ+v/8qgWAWBUlhu7bPMsjo5C+NaGJ0oBoIUter
	tFFk3Oa2IIwIlhem4Cnori+1B0X9keQF1dxZiFTPBMqAr0XSNtZoyFLOZ9z0AJpU+hisUUAJX8UOG
	fKhCruBKoqLKF/wBa0zmGnUCavFLnMvATYdklGVEqIo5dsMUAy80K3okza9Xf3NThiOrnmthwrm6w
	bQn0rPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJl-00000004oeS-08bi;
	Fri, 09 May 2025 20:27:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDS9c-00000004Wyi-3Z5J;
	Fri, 09 May 2025 18:09:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E2905C6EAE;
	Fri,  9 May 2025 18:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D908C4CEEE;
	Fri,  9 May 2025 18:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746814139;
	bh=rmApFCzA/VMmdODpUj4/fzF7DClCCzkmQq4dgE+/N/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NwKGMDqtaxZ4cge6Xjczald7lOTaRMHFoNVHlruiKX4ZWZvpDvSxHtTRtKa1lhkme
	 KSxDcNwtVBJcwSMHzi8/qGrSEQ0HKg582aSZauiN4difEnxvfQ/+a9l62xr3k7Ba+i
	 v0jKJjb234XTQ5vnpnCfTNiS7POSqlanpdF5+8aYNCi8eONxnixUzHxqEvi3Fz3oaT
	 4JlK0/A5Okz80bTAMTNPnabCy5y8n1hi39WTguqTeLBZNDM4ZimvtPQMBqFg5Uef62
	 mUPxqPfrltEgB0pkbYrdALq91uDJrb9sYHTLQZ1BB2U+L1R+wzhwMetjAgRVcbBmqA
	 Mri/IqM4Gz2YQ==
Date: Fri, 9 May 2025 13:08:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 04/13] ASoC: dt-bindings: mt8186-afe-pcm: Allow
 specifying reserved memory region
Message-ID: <174681413699.3876088.12249965431481195226.robh@kernel.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-5-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-5-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_110900_927476_96B8B03B 
X-CRM114-Status: GOOD (  12.38  )
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


On Thu, 24 Apr 2025 18:24:58 +0800, Chen-Yu Tsai wrote:
> It is desirable to reserve memory for the audio frontend.
> 
> Allow the "memory-region" property, to be used to point to a reserved
> memory region.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


