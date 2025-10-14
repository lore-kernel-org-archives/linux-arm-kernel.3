Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4787CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRai4cVyjGy/v6uWoHz4lYyQ5z+kahgBJhjVCyIcJe4=; b=jyvSTvGUMELg0aFIFHMokm9iGb
	THMWg3MFhKBynlEVBK8o6Aq6WeZhkFq06sEkEScZ6SQC+AtcyqF9cVpbImNWSY51rccuknK/2ZpD/
	eGyFO/gYrOR4l9Qz/vwn6i6nohhD9/ncx0Ka+GuRLTVH6Nmn6ZrHh73w9c/0iJhCJ+i7ku9oggKkH
	WhGRsyqkRiAF+SmhyHg8KIy/hdNWL3GuZjHnmw6qGKMAjJtlzgnPitMzLEprr8WZYQ6wLTNKDZN0t
	fezrZWVRlJrybZ5rThRfQGFbomBwF9ZIGfL77QHb3blae8iH9LaD+GhTzAtGmb3eCAfPacTJ+S6oW
	G0CJVXAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aVb-0000000FdNF-3ttU;
	Tue, 14 Oct 2025 08:35:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aVY-0000000FdLL-3dDA;
	Tue, 14 Oct 2025 08:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D256443DB;
	Tue, 14 Oct 2025 08:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A2CC4CEE7;
	Tue, 14 Oct 2025 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760430947;
	bh=oIVvBDJ/3Y6oHKEA/tnipAXLIxVldUvt/b92nJT1Fy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DV0LB6QEef72tfYVDZxGyT+02KnMDyVQ8tAEpyXdjnvqyuMH32hD9tYpE9roWV1Ur
	 goCnXs1/x6bHx2NIFnN8Y3VF/gTJsyF4SEXn2x8jnznMKBo8mbxsUvPgHZ385hGFWs
	 YD13rJzyzooBmDtAs3yVEOLmiv4zyvipeyogpXO0zQdN2ciOk70HAip9zlDc1gU2Q5
	 S/P9MLqN55pnfSjSwtxangJoeQFvKAdzOQvdcpgrrXvCSbW73WXunJD0jqmgzKEpDP
	 /4I4hem1GSrWmSm3ArcGwbaxaKTlDA5tmsYKY8RNaW1vwE99kVc61CndW33t45tGpq
	 FIkyrsLiDi7Tg==
Date: Tue, 14 Oct 2025 09:35:42 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 3/3] net: airoha: npu: Add 7583 SoC support
Message-ID: <aO4LXqpL8dVQ-QG6@horms.kernel.org>
References: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
 <20251013-airoha-npu-7583-v3-3-00f748b5a0c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-airoha-npu-7583-v3-3-00f748b5a0c7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_013548_924497_91A305E1 
X-CRM114-Status: UNSURE (   7.34  )
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

On Mon, Oct 13, 2025 at 03:58:51PM +0200, Lorenzo Bianconi wrote:
> Introduce support for Airoha 7583 SoC NPU selecting proper firmware images.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


