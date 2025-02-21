Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FB0C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evPi6dQiCO3IoUOpjRp0eIR+zPz18r17WDupYoyNt7I=; b=m668PKrG9uEu1ieXHupYQTDhTD
	O+djYBjowTW1fIrlq+0lmF3n4bi3KvHt88M5dHFBIjgtCRNtaXoFruB8/iXXAM3EN6q99r1FxF5MR
	G8hW09VrU0+Ob2R5DmW3Yrwra2nQ6CmYYA+69ccHJmy8b5IIXy3ympyyQD81xEwz/WmcU8DH5xta3
	uVT4Fr5Hf0RMmJu5L8tNDQTWZvJCUTiVK/svaG++Q08E9qTwG3zNYEJ+WEouAyjLUMDS/TpdP0ztJ
	pG0dc0lO6EP6HFw/0E5VDSbG5LfLl0OTPM8E+/CsLppRKvZgVn6O7yCTwcNH6gBndEo0uNNl4qP1S
	cw13KpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVMb-000000063Mk-1kB6;
	Fri, 21 Feb 2025 15:54:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVL8-00000006319-2sSA;
	Fri, 21 Feb 2025 15:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740153200;
	bh=DRRk8ySHM7d80jUzaigsI9T4dZ5O56rDrKF/hwqGjjE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LGll4wxMdtC9VuU1cqAJl3FPPep48bfwtMgKC4WgcM/G8HMuayRO29U0ZUSgfakeq
	 tBq1E4kJN6BHNSfXtNb6p1qo7xGOi0P5Xm02uplDWaE7YJtYoKI4NJtea35tD54mcE
	 EQh2uwfFMkJzmfvwlfUKsPkAlf5epvS3tFqakLDOCamE6Sdlq9rP37BFbCfKYyrvp/
	 fzQyeBkIvQ7724xVu1CEFsY6H0qyIzQ/RksSUeN9WLwDf5UaDOhynR0AnCpviJISut
	 uHgqKDSgMMJGaYK64TAfB6Y0mYvYLizMcimTLF8DiQzRgNjr/l3w9GOTH644nscv57
	 R3kv+iVFRl6sg==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1DE1217E0199;
	Fri, 21 Feb 2025 16:53:19 +0100 (CET)
Message-ID: <cd8f43a310f771f7db7ae1ab7fb2f8b5d554c2da.camel@collabora.com>
Subject: Re: [PATCH 0/2] Add support for MT8196 video encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, Yunfei Dong
 <yunfei.dong@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Longfei Wang <longfei.wang@mediatek.com>
Date: Fri, 21 Feb 2025 10:53:17 -0500
In-Reply-To: <20250221031004.9050-1-irui.wang@mediatek.com>
References: <20250221031004.9050-1-irui.wang@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_075322_869208_6171AB1B 
X-CRM114-Status: GOOD (  16.59  )
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

Hi,

Le vendredi 21 février 2025 à 11:10 +0800, Irui Wang a écrit :
> This patch series adds support for MT8196 video encoder. The changes
> include introducing a new encoder driver interface and add support
> for the
> new encoder driver encoding process.

thanks for your contribution. In general, when adding new HW support,
we would like to see in your cover letter your v4l2-compliance report. 

Since this is a firmware based encoder, we also want to know how the
process with uploading your firmware in linux-firmware is going. We can
do reviews ahead of this of course, but merging depends on having
firmware upstream. We did some favours in the past and it worked for
many SoC, but things seems to have changed lately with the MT8188
firmware situation. Hope you understand this concern.

regards,
Nicolas

> 
> Irui Wang (2):
>   media: mediatek: encoder: Add a new encoder driver interface
>   media: mediatek: encoder: Add support for common driver encode
> process
> 
>  .../platform/mediatek/vcodec/encoder/Makefile |   1 +
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   2 +
>  .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   3 +
>  .../vcodec/encoder/venc/venc_common_if.c      | 704
> ++++++++++++++++++
>  .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
>  .../mediatek/vcodec/encoder/venc_drv_if.h     |   3 +
>  .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
>  .../mediatek/vcodec/encoder/venc_vpu_if.c     |  37 +-
>  8 files changed, 764 insertions(+), 15 deletions(-)
>  create mode 100644
> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
> 

