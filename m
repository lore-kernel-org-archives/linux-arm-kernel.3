Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA2ACCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 04:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdX28Sdl2sm9H29cIdcoS2Mp+zYVt+TQryJsXc11de4=; b=zMKbZalrMv1HpeoLsUMjtzA/LL
	VxmZbXJtTV7jsHQyJo8Zq/q1JZirGVGGcRDtnM30+9dAmSabG54Wep9/dUxEpFYdsaQ0+g86Bf/rQ
	rLpxLuiXv5OKSs4CUXvHaQs+0lrxg192RUIXFnkvHq13rkDv+DsEXAbsgCZew/p8gIsNSJh2bbAXF
	0yvdLeJCRIY/bIoTjcBlWm6Y56rskgYQmOEC6g9f1dyNfNLjaAhZL+efWj2XhP9ceyLKeN+mB54hW
	xWQIsazoyIaJgLwtWFx8wh0GIvz47E414eN73X/TY0+qWGlraP6Xkc118yqxBU5odQMucZavrn0et
	v0VQALcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhlJ-0000000Bsuy-1ta9;
	Mon, 20 Oct 2025 04:44:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhlI-0000000Bsug-0mJ5;
	Mon, 20 Oct 2025 04:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pdX28Sdl2sm9H29cIdcoS2Mp+zYVt+TQryJsXc11de4=; b=ES1sxOxFQLHBy31MCmVBaU/TtP
	wRvmtRv97/44ij7FHMQvo0zTbTHhZRBKiMNu+6DdGJOiMbytvGVRbZXOvfix6btcO9hXh79IC4HYi
	R/s5HGUe6k0TgPvHpkZ3tE3J2Cx529RQgZKDD9Siw/Y+QY6nh+VLsbD9RaPHktfsXLIDjYXGXQRtD
	18+635DfOqbNE2bPdZDQ8cY+GXwDD2Sqsl5Os+Z5EepeJ9pxKne7h5yvMKvA1v13zdByWH80F9XzP
	YttSgf5wdGvR1nUxb4Nr3LRKo2NyFf0p+655HtZUTFYThUFFvLNtBzYyj1K5IcWBta5Ciwt9AEAcq
	RM0cJcGg==;
Received: from mgamail.intel.com ([192.198.163.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhlB-00000009W95-3oLX;
	Mon, 20 Oct 2025 04:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760935482; x=1792471482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=304Yr1T1ZRL1VpqnFx3paSyfEmkD8GLktg/kA1hWBsE=;
  b=UahMx0WuKElkvoWKqM2zzVmqRifTJsjaBkW1HCgEBr+tEDYFdhGgsUmG
   KqQOoieU9WaLzGwVYqs/XGruzRiNGllu34noQbOcT7J5tKysp2an9V7JN
   0KUV0qpT5ZNpkQSQr20YUwlYN1FSv7/g08FOpcnF2JpnecF6KtETjHgiu
   9bf5XYET+9DFV4x4bbmFpTFBKlb/tVNRGZ5NbjnbmY3JZYoat8NGP8SS3
   hmhjfU5XKwLhW4Uc7d21Vzw9106CZS15Py6wUp7QMXMZzvW4Jv+mKk2Bf
   A37bgGJYZcfIQd1rMgg75WaVaJQUc0JI++YDmAJTH7PGY7bwVmrCrQdS+
   Q==;
X-CSE-ConnectionGUID: 9BIP8X1yS3ikJfT/+DHOEw==
X-CSE-MsgGUID: A0FS/8l+QryWAqh1t1sodA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73723166"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="73723166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 21:44:36 -0700
X-CSE-ConnectionGUID: 4z0u4NppRxm0lWYQ3abMHw==
X-CSE-MsgGUID: LAjfWbQvQ2mnz75G2nGsJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="187657353"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2025 21:44:31 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAhkO-0009U1-0j;
	Mon, 20 Oct 2025 04:44:05 +0000
Date: Mon, 20 Oct 2025 12:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksander Jan Bajkowski <olek2@wp.pl>, nbd@nbd.name,
	lorenzo@kernel.org, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	howard-yh.hsu@mediatek.com, StanleyYP.Wang@mediatek.com,
	rosenp@gmail.com, luoxueqin@kylinos.cn, chad@monroe.io,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] wifi: mt76: add tx checksum offload for mt7915, mt7921,
 mt7981 and mt7986
Message-ID: <202510201250.Hpsrohca-lkp@intel.com>
References: <20251019155316.3537185-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019155316.3537185-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_054443_890402_0B24BC9A 
X-CRM114-Status: GOOD (  12.70  )
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

Hi Aleksander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.18-rc2 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksander-Jan-Bajkowski/wifi-mt76-add-tx-checksum-offload-for-mt7915-mt7921-mt7981-and-mt7986/20251019-235515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20251019155316.3537185-1-olek2%40wp.pl
patch subject: [PATCH] wifi: mt76: add tx checksum offload for mt7915, mt7921, mt7981 and mt7986
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251020/202510201250.Hpsrohca-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201250.Hpsrohca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510201250.Hpsrohca-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt792x_core.c:636:19: warning: expression result unused [-Wunused-value]
     636 |                 NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
         |                 ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +636 drivers/net/wireless/mediatek/mt76/mt792x_core.c

   618	
   619	int mt792x_init_wiphy(struct ieee80211_hw *hw)
   620	{
   621		struct mt792x_phy *phy = mt792x_hw_phy(hw);
   622		struct mt792x_dev *dev = phy->dev;
   623		struct wiphy *wiphy = hw->wiphy;
   624	
   625		hw->queues = 4;
   626		if (dev->has_eht) {
   627			hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_EHT;
   628			hw->max_tx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_EHT;
   629		} else {
   630			hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
   631			hw->max_tx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
   632		}
   633		hw->netdev_features = NETIF_F_RXCSUM;
   634	
   635		if (is_mt7921(&dev->mt76))
 > 636			NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
   637	
   638		hw->radiotap_timestamp.units_pos =
   639			IEEE80211_RADIOTAP_TIMESTAMP_UNIT_US;
   640	
   641		phy->slottime = 9;
   642	
   643		hw->sta_data_size = sizeof(struct mt792x_sta);
   644		hw->vif_data_size = sizeof(struct mt792x_vif);
   645		hw->chanctx_data_size = sizeof(struct mt792x_chanctx);
   646	
   647		if (dev->fw_features & MT792x_FW_CAP_CNM) {
   648			wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
   649			wiphy->iface_combinations = if_comb_chanctx;
   650			wiphy->n_iface_combinations = ARRAY_SIZE(if_comb_chanctx);
   651		} else {
   652			wiphy->flags &= ~WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
   653			wiphy->iface_combinations = if_comb;
   654			wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
   655		}
   656		wiphy->flags &= ~(WIPHY_FLAG_IBSS_RSN | WIPHY_FLAG_4ADDR_AP |
   657				  WIPHY_FLAG_4ADDR_STATION);
   658		wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
   659					 BIT(NL80211_IFTYPE_AP) |
   660					 BIT(NL80211_IFTYPE_P2P_CLIENT) |
   661					 BIT(NL80211_IFTYPE_P2P_GO) |
   662					 BIT(NL80211_IFTYPE_P2P_DEVICE);
   663		wiphy->max_remain_on_channel_duration = 5000;
   664		wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
   665		wiphy->max_scan_ssids = 4;
   666		wiphy->max_sched_scan_plan_interval =
   667			MT76_CONNAC_MAX_TIME_SCHED_SCAN_INTERVAL;
   668		wiphy->max_sched_scan_ie_len = IEEE80211_MAX_DATA_LEN;
   669		wiphy->max_sched_scan_ssids = MT76_CONNAC_MAX_SCHED_SCAN_SSID;
   670		wiphy->max_match_sets = MT76_CONNAC_MAX_SCAN_MATCH;
   671		wiphy->max_sched_scan_reqs = 1;
   672		wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH |
   673				WIPHY_FLAG_SPLIT_SCAN_6GHZ;
   674	
   675		wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
   676				   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
   677		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SET_SCAN_DWELL);
   678		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_LEGACY);
   679		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HT);
   680		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_VHT);
   681		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HE);
   682		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
   683		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
   684	
   685		ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
   686		ieee80211_hw_set(hw, HAS_RATE_CONTROL);
   687		ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
   688		ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
   689		ieee80211_hw_set(hw, WANT_MONITOR_VIF);
   690		ieee80211_hw_set(hw, SUPPORTS_PS);
   691		ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
   692		ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
   693		ieee80211_hw_set(hw, CONNECTION_MONITOR);
   694		ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
   695		ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
   696		ieee80211_hw_set(hw, SUPPORTS_ONLY_HE_MULTI_BSSID);
   697	
   698		if (is_mt7921(&dev->mt76)) {
   699			ieee80211_hw_set(hw, CHANCTX_STA_CSA);
   700		}
   701	
   702		if (dev->pm.enable)
   703			ieee80211_hw_set(hw, CONNECTION_MONITOR);
   704	
   705		hw->max_tx_fragments = 4;
   706	
   707		return 0;
   708	}
   709	EXPORT_SYMBOL_GPL(mt792x_init_wiphy);
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

