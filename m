Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A489BC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skj4pX3NOOfoLevpuz8jo1SWRBnN16xLPEINPH7xJS4=; b=06qAv3Z3kRAvFV91ihSRf2tQbx
	vnUs5M0AxU9vS5l9aCFctdqVxZfji2PVMIknLJPBNsM6IazPhF/hr3S+2k2q30/Ylk3lyhz1wWm7h
	KL9ogzUXWGhyaCwLUvIOvTcVayOQGRyn2+sALfYl3i6XfQ34B7VN3M2ZArmmnVCykm7DUMbzEla6O
	cHNfyulda9ZoJmZmdLp8+/oUZRQMRpm7g/7iBeB70ZxaA3w6eWMOKgHUqBHonrTBE8k4Fgw/Fa9dW
	vye0z/HMHNqEGqNNHhTJmYyJCzBOrkMBVcr9bMmrbJFJUajtE1pLRSgktBnOc2mbsFuCu0q4ojhiy
	GbicGDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55bs-0000000AFXe-0RSX;
	Wed, 16 Apr 2025 16:27:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54ta-0000000A773-1UXx;
	Wed, 16 Apr 2025 15:41:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39AFF43E6A;
	Wed, 16 Apr 2025 15:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D03C4CEE2;
	Wed, 16 Apr 2025 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744818108;
	bh=vQNpjmpFpTsHsEWunk4OoC7WEKC5Hn03PMynv3OZZgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GIbXq5Rf0HiKSulusgu7kAbaQvSZzlyI1M1o8/JFXWug16EbyLGZpscDMsEx+nZgi
	 Rma4Ms96IbQqP2p4+qDexz1E7eglSpZCpJu2sfMRWVrmUZ1GPh1sRHcWwoC4mLMZt5
	 5CBiw3s3ibKb5noF7YniwSyV5vxgi5sEvCuBXbttJ7KD71a5W4PXd5MRH/RaltzvTT
	 WLA0O5Gs8ZX53DHoT0mMlMlH6S5uGUYeZTplfHF/C5dDFNlWoat70zsFij2PSS97vD
	 XkB+s/k9FenNxMdYVAJWV9CBwSCPUgyVVuOo/OQOp4j+R+ZKevbUZ/JLfcWI2a417t
	 lGDlmmMki2qLQ==
Date: Wed, 16 Apr 2025 16:41:44 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <20250416154144.GT395307@horms.kernel.org>
References: <20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_084150_412017_3A499303 
X-CRM114-Status: GOOD (  19.89  )
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

On Tue, Apr 15, 2025 at 09:27:21AM +0200, Lorenzo Bianconi wrote:
> The official Airoha EN7581 firmware requires adding max_packet filed in
> ppe_mbox_data struct while the unofficial one used to develop the Airoha
> EN7581 flowtable offload does not require this field. This patch fixes
> just a theoretical bug since the Airoha EN7581 firmware is not posted to
> linux-firware or other repositories (e.g. OpenWrt) yet.
> 
> Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
> index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..16201b5ce9f27866896226c3611b4a154d19bc2c 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -104,6 +104,7 @@ struct ppe_mbox_data {
>  			u8 xpon_hal_api;
>  			u8 wan_xsi;
>  			u8 ct_joyme4;
> +			u8 max_packet;
>  			int ppe_type;
>  			int wan_mode;
>  			int wan_sel;

Hi Lorenzo,

I'm a little confused by this.

As I understand it ppe_mbox_data is sent as the data of a mailbox message
send to the device.  But by adding the max_packet field the layout is
changed. The size of the structure changes. And perhaps more importantly
the offset of fields after max_packet, e.g.  wan_mode, change.

Looking at how this is used, f.e. in the following code, I'm unclear on
how this change is backwards compatible.

static int airoha_npu_ppe_init(struct airoha_npu *npu)
{
        struct ppe_mbox_data ppe_data = {
                .func_type = NPU_OP_SET,
                .func_id = PPE_FUNC_SET_WAIT_HWNAT_INIT,
                .init_info = {
                        .ppe_type = PPE_TYPE_L2B_IPV4_IPV6,
                        .wan_mode = QDMA_WAN_ETHER,
                },
        };

        return airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
                                   sizeof(struct ppe_mbox_data));
}

