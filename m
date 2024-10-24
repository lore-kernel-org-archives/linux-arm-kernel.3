Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A9CD0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2sOZk//md8Jf9ZEknBPOk3bIW0TicV0anhGgt8+cWU=; b=zcH/RQPmtbIkorE9iknDMHQudr
	Irt0EnUKmi5velTyU387OEigV08N1GwpNnhjzM27AFa/EpPqy9Z8YvC8XBPggSGzYERp3iJhgpGkG
	I7/UnMLSPp22E1POaSNNXJYYtcipKm8h0ci3+UVx02VHDKTR05+aIDU57QbiWI6jq5kS+vxMbwcVg
	/63IAtg8fnnphRustt+jc0gAJtqek0GXudMg+gl/sbrcapKcWABBSmVSARPdZOZbHqw7tfdNECZLR
	6TR/aR8Yif7IQ+WcR15vJllVhOEoEhnYumak0LM74OqWWigMUCsQC0z9DA1+ia3Li9WkbG92h6JjW
	IHHWa8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sY8-0000000H9RR-0amf;
	Thu, 24 Oct 2024 07:46:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sTw-0000000H8Df-0YLV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:42:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2A63A4519A;
	Thu, 24 Oct 2024 07:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85180C4CEC7;
	Thu, 24 Oct 2024 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755726;
	bh=akMjWLE8qYGttquQCblw2DikoT+w3bJja6jPMKFBvB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGahbl+leH5V6GGOLqdl4wpjv9iNL1RxGUQsrdj6ydm3EERGe8QNKiE20M6flvRoY
	 +G/Emgrpj6rhR7buOAfOPoWCVwma1KzoM8jUKwAPGpGuv0QDrWUXpjvzys/oZ9t/IM
	 CC23IKZ1vpFZ+YLwXfiRY2s35yo9mcMqNNap42ghTdphQHs0Ju5+tN3uBwtPkknNXj
	 j4Lfr/VsXjGygl/BKv/FK3e3Nwa4GCcdsqqCe/borDu7S97a7DDQAPbndgE1v7Mr/D
	 uaFhSRI0iT4EdwzWZbb9SORorNy2L7Ic2Gm8C4LNZeqCBDerw9z48NOb8kBejkmlAm
	 6/1hPqX6QJ2GA==
Date: Thu, 24 Oct 2024 09:42:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, lars@metafoo.de, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/3] media: adv7180: Also check for "adi,force-bt656-4"
Message-ID: <fqrusqlrvdl3hcvm6ogxf3baksq5s6ng6xhct7v2slxjtfteuo@ipllmg3444dg>
References: <20241023144206.1099622-1-festevam@gmail.com>
 <20241023144206.1099622-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023144206.1099622-2-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_004208_254286_577A16FA 
X-CRM114-Status: UNSURE (   8.00  )
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

On Wed, Oct 23, 2024 at 11:42:05AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to adv7180.yaml, the correct property name is
> "adi,force-bt656-4".
> 
> Expand the check to also test against the "adi,force-bt656-4" compatible
> string.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


