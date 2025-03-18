Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D1CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVBwO/zUh3XS/PEJra5StR8gIuJL+/G3hxwyPRudHmQ=; b=xyw5NV75TUxX6Oko5StXgTpIOA
	M0PeDjWisoq5Q9GKs4jWORl0HbeEOkeYBsn6lCadPWFlh+uV9scxUnzDW2tJfmFpSSE1FZnBlRWrr
	WmTLf1buqEXi7iwVFNF5GVu3G5OtOXvylG/OLfv4Gxy/H+vkoZnmcASfCL23dHod6Kmg9UD/Zn/kO
	GBb1clMg3hydi/U2g/Z8FrrOjme1QPFUmbUzw0cOpEqANYwVRuy8EiTR5CLdR2VXCdTMLJ4sp4BST
	T3b9+sMPQPKCwPBFDcQ1644Eu37pbvf7Gi+++C3Oi/y2WccpatRyIf1gg+yWzu7J0z7nnLhV5qbHX
	20RdFj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY55-00000006CjB-2MEC;
	Tue, 18 Mar 2025 14:38:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY3N-00000006CQq-0tpw;
	Tue, 18 Mar 2025 14:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742308583;
	bh=BszjjWPBiRXCAq9+SjLvTIzV/2BzX1g3T0xH6nCwWTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9qbVU5kRtV+7KHu9rj0ev9uLjhEERqRjGZc2JknKYmkqnLDdRbS73dXu3N5PptlM
	 jqtS6nFT+FEUsZTU8k8AAaKRu8pTCGU9PMh1t278ce68Q8SNcPp2ldlbbierlK66GW
	 pS+xYzH7KVviklv9a899v8A5IMMnRsJ9Y3gIT51JBqyjbrcFykUP+q+htdaEp/yQgI
	 OG4LYUJOCyp15uXDW7Rp9Ni1iYQSiblqenNuFCPdHXaq4P2SBEyRcUt5wxa+1utZHB
	 NskUmH0ZkkMQKOGTorPj8GxA0dKf26K0wor4ucSYqYN8Mt0KcZSD227oZWJ5OvPXBw
	 LsOmwZoAqAEuw==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CA6317E0385;
	Tue, 18 Mar 2025 15:36:20 +0100 (CET)
Date: Tue, 18 Mar 2025 11:36:18 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	bleung@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH 1/2] platform/chrome: Add support for Google Spherion in
 HW prober
Message-ID: <f74001b3-ea40-4acc-b8a1-635532a5f205@notapiano>
References: <20250318102259.189289-1-laura.nao@collabora.com>
 <20250318102259.189289-2-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318102259.189289-2-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_073625_428825_B2C20C9C 
X-CRM114-Status: UNSURE (   8.30  )
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

On Tue, Mar 18, 2025 at 11:22:58AM +0100, Laura Nao wrote:
> Add a new compatible entry for "google,spherion" to the hardware prober
> platform list, using the same I2C component prober and trackpad data as
> "google,hana".
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

