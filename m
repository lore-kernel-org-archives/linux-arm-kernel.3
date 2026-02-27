Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DC1FEFB6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=raohb+OnpA+Nei7LomVrzYabDf87CTd9ehaOWBdgJGk=; b=a2Txz1+ZA8brJyceHcKccGuXFv
	6/jYQm4dN7iEVpZ45XW3pvCAx972Ov9P+y0ifTRWWHcQlauNxWvfHiygY4RoQsTpykBDxu8iiHFB8
	/veGbjeYfz4doKUO+IwtVFTJZAh+buTbSVjeS2I0esf3n1UtL5OtPPCQCoTcnvt4Oi1cQ+b0B00LI
	TzoY5vIkBsCPd20IBSv1Ptshm/q/j6AoArvDxi9QjtXfPlwXLKhpPZ6Eo09Uf6mxojrE5TApydmpe
	kknsSAm+8dMENvxwTE1I0QpK7m+5y0OZk72RROrqa5C0x13CbJx/iYN5ve36nu9BJ9Q7xaUBoE9lq
	St/w1h+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw091-00000008ggN-2OBh;
	Fri, 27 Feb 2026 15:52:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw090-00000008gfk-0oBC;
	Fri, 27 Feb 2026 15:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=raohb+OnpA+Nei7LomVrzYabDf87CTd9ehaOWBdgJGk=; b=KWbdtUACEoJhhrzLJoDNJ0Oo2v
	HB5JAi9y1HLdg/8b7J4y3fLGQHM1scsnQxcekx7mp9jTLzwSxIW5aq9nRhzOZnagMJAbJPdxYnfNM
	CBiTC7XMKiX/jl+fmh/9/FmbdL2AVxwTYwXmroqJB6jqaPR6vo0bfs/bheuxSmlKp2s0TkE/lJhZ9
	6Aatt9a+mHZAT2biNZXh8BFr8qCoGv4ZEBOEPGjiMZHBSVVNlKqrWwc5DpB4tejW6hMy1MkD3IS+t
	JEuiGwjOgg27YtnzYzAUtVc2Un8H9mmqZ0hKdvPvu0dG3Q6Rum3fXQbRI5A8Xzk69Tn2R+PraE4xz
	bGgpvBCg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw08v-0000000DQnG-3Iou;
	Fri, 27 Feb 2026 15:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 452A743810;
	Fri, 27 Feb 2026 15:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99433C116C6;
	Fri, 27 Feb 2026 15:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772207557;
	bh=f45vMFSM+cbg6BIT4gb2mHHhAB+82XYmdtpsZXu6y8o=;
	h=From:Date:Subject:To:Cc:From;
	b=dSX/yAbKDT8GYcoF0V1ZeVPeKXrr0so50mXacVtvjae0z/HUWE9Y4I+ZhJ15axeCP
	 CVy54CH2evuDnlgWVBovzdakTvHnRJxAU8Evddu2bEDsiVl5TMEiPhH9AxL8JXrlm8
	 AmzODyD4VePSTvldhpvxhQm+b0lU+hPoSeaxEOzyoLbBMHz6eRQLUuzrvu5DheJzLk
	 2SLngo8gA/P1BGNCsEf6H54wDk/8yP+qL/3MMJRBo0dbGl0vss3LNiQhEJAsOHhp9H
	 Q2zCZmCIBFptge0BnKYDyZRIq3bWOE42PyROuuRzyFcSM6NRRb/SRY8plxzJwp97Q3
	 hNp4rXoowxN0g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 27 Feb 2026 16:52:11 +0100
Subject: [PATCH net] net: ethernet: mtk_eth_soc: Reset prog ptr to NULL in
 case of error in mtk_xdp_setup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-mtk-xdp-prog-ptr-fix-v1-1-b73d7588b645@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bqGEivpKdDBbbYlMVolA+nvSc
 QZmMkQSpghTlUHo5siXL9DWFZhde0fIW2FQjeobpQY804HPFjDI5TAkQcsPatuN62gMDauGkga
 hov/tDJ4SLO/7ATjD46ZrAAAA
X-Change-ID: 20260227-mtk-xdp-prog-ptr-fix-af59b9cce7ba
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: Paolo Valerio <pvalerio@redhat.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 bpf@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_155242_639866_C431DFB5 
X-CRM114-Status: UNSURE (   9.66  )
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

Reset eBPF prog pointer to NULL if mtk_open routine in mtk_xdp_setup()
fails.

Fixes: 7c26c20da5d42 ("net: ethernet: mtk_eth_soc: add basic XDP support")
Suggested-by: Paolo Valerio <pvalerio@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e5e2ffa9c542bfc88dc0d7553d0a6b2a169ec74b..e199f2e243d21f3545e8282ab821135e0962f5c3 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3751,8 +3751,16 @@ static int mtk_xdp_setup(struct net_device *dev, struct bpf_prog *prog,
 	if (old_prog)
 		bpf_prog_put(old_prog);
 
-	if (netif_running(dev) && need_update)
-		return mtk_open(dev);
+	if (netif_running(dev) && need_update) {
+		int err;
+
+		err = mtk_open(dev);
+		if (err) {
+			rcu_assign_pointer(eth->prog, NULL);
+
+			return err;
+		}
+	}
 
 	return 0;
 }

---
base-commit: fd6dad4e1ae296b67b87291256878a58dad36c93
change-id: 20260227-mtk-xdp-prog-ptr-fix-af59b9cce7ba

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


