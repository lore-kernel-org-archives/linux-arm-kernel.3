Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D010D10389
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 21:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=; b=b0g+QNHQLZZoeMYNeyKmYTk9Xd
	VEIl8cuf7oNvehjYCzuyOP/mGVtAbuPS9QDm1S1vO2G2pcE+9TvT1BXfyzrz9ndN3alcvX3Sx/T/F
	hA6dzSKjnMJRvZKx2WbkZSMA/WZbaRQOqBEQRaCrkCf+7/ADJd/DC409I6+Y/iPek5tTtt4NIxnX6
	sB3HBSgJicuGZKu917Dd9Rv4MHcqFgKh6cn9EXMd4918oTh3yVPW+MhcA8iJ0oCKr77UarWSKbg2T
	BIxSf/Bz66omd93F3Yiq/PnPuGeha81EvNyWPfe5M/g8v9smDXnJroLsyrguri5TS6pCdRc3sVRt0
	1wq8VZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t45VX-00000001sau-1JqL;
	Thu, 24 Oct 2024 21:36:39 +0000
Received: from mail-4317.proton.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t45Ty-00000001sTc-3RZy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 21:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1729805698; x=1730064898;
	bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GchmDkiwzjHUzphRTZ7mqVaLX2rZofgM4AeXNI1oLuZBQlf6NiAkhwO71L7ZqlXw/
	 Z88fUiHzB4reDhzc5BLtCRTrWUdeZqFf66kACHNnSXaqgQi7HFFDbaKXtDPCI0lwvQ
	 /xYfCYTEs5rqpCsP8XHu0Odx7iqSfJC3vAaYm8XhI/K/7f+I+GiorF/ipKppCXwiyA
	 XMuMoPP/6Fu3JAfGd/63W6CNXBijFN6BkAFXgu5r4W6EkWgqy1uOa6cwu1xh9PgXWk
	 B3aIk07fwbgTww5H7lkC3sqYqqagIcF+hOR1IQ6Vlhq6qUeyvdDsdSCQv/IJZB+fsI
	 /06b1a3z3rctQ==
Date: Thu, 24 Oct 2024 21:34:52 +0000
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, Javier Martinez Canillas <javierm@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and all drivers
Message-ID: <QMi2RXA05r08zucgpXkakwSfIm28vqmqYoOP-Da66Gq4jQWGZA8PfpAGd4z1VYfU4ao-2sj4u5qO6n5OpQv-ccu8Rwtm5Y1MNpQ-rpTo0tY=@emersion.fr>
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>
References: <20241024162240.2398664-1-jani.nikula@intel.com> <20241024162240.2398664-2-jani.nikula@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: ff36b191848725b70c63fcfb4b045f3132e16d83
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_143503_485433_88ACD648 
X-CRM114-Status: UNSURE (   2.92  )
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

Acked-by: Simon Ser <contact@emersion.fr>

