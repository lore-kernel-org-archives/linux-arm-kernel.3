Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC358C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XQTDX8Alv29qulK4sXrqEmrdIZusnQjdpDN5F5ZMILw=; b=3ff32W3cfwKWDWQ3yQkAAI2Ffc
	yHxThNDUh9pe2pH5P2wSVWcGI4PlJMqPe73Nl1HoPlz8vJ4VpdM3qOBS3Ff1eVD/MOWjsdmtllP43
	9P6fxGznxYPNiqdCjzsHf2NctFSpXNMlhQ/UdkAz0SIW5xSHp2D6711fRsOAuCJNY3zIIlM1r8K/D
	Mo3JGfzwbwUFIqQVhC3OGEV1m1/5XlF48IROAYV5CthxztU0azraAcuULjc+/lOkJp3G/F1hD3VxI
	SayNSDZK/6iBlXG9zl5Ltd9tbnb6Wy6IjwE+8H48Cjkm8a1665veM0TJemBGQhrnoL/9OD6bLXPq8
	bzX3cCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vpU-0000000BOki-1Ef1;
	Thu, 10 Apr 2025 17:36:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2unm-0000000BClO-3QOi;
	Thu, 10 Apr 2025 16:30:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3995ff6b066so539940f8f.3;
        Thu, 10 Apr 2025 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744302653; x=1744907453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQTDX8Alv29qulK4sXrqEmrdIZusnQjdpDN5F5ZMILw=;
        b=Tc9GO5HeLnDcMNotU5QXX7D/4onW4WoW73I9sd4vZ+MaYYnhrsiwN0o4M9Zj71xruq
         Lnlmu+zsp2IzjvTEjXJxLoFzdzPVo30Cn4baYzS18TI+chTN3jqCWgL0IgMEVqNm07Fi
         B/S1RzyHXEzHjmkoMFUtFuqvqJHMtUuxgtJ9V6Cp2bKRd1Hwb2jk9wu0oH6ak18gzg0H
         0LXlPBO0eOSDS7myE7Bh5u0DBemycuBKuV95+bcq6HvpJAFL7YkE+bwHvhJhOmJ+Sasd
         mYLh8/Yzu1TPz+MxaPnexE/ykzv8JUHarw0wgOGl5rSA43o7usjBjL5dP9nqoS8bprxw
         GSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302653; x=1744907453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQTDX8Alv29qulK4sXrqEmrdIZusnQjdpDN5F5ZMILw=;
        b=kjDJhtjVSaRHRoYDqwcLLecZm8SMz0M0+niw+0UCDip0HFFlA0BlaNSxl1tnFikK9p
         1OZknLiz0KIDKpeUl7M1vWtP9ouTHh5Zoh2rzXpmDn/IGHIexWv9Z6bdjSbSdWex+yUC
         i2naZEsMBJrOzO/cFhGPruwxw4q+bj98BM8lojsdVvSd27OGj+SeAyDlneVEM7lkdGBG
         Qwo/0IdxpgPsx+U6+po4i24POAQVY3ow9Ei9ezKNY4CwGSaifztxz6WL8fj/ZbTOK/ps
         u3KK8DFtoeTMctlFNfOm/qgetqMuA5z6cEWN4LMt5xV/KHMl5pIOpQxcfBFOtm/I4Q+c
         Jzmg==
X-Forwarded-Encrypted: i=1; AJvYcCUonfr6UfQALcOimyOmnUDnuqbL10gfx/S7XJwg26td71G8S5wlGNRsrpeqvhlaBVeQ83FR6YXGuOG4FGUNERY=@lists.infradead.org, AJvYcCUzmhUYRNBiARPaBXipQs7dxht9TVuBeDhKsT/CZh4eQjjtRvEOPdutnXund1HQd8yAOeeChVHin+l3DkY7jW2D@lists.infradead.org
X-Gm-Message-State: AOJu0YyC7h00S3SO9Erxuxz1J84Rrq5/LFBnHVRnusFqTgpqJTpBbZny
	5Cm2rj0TjWXbmDh1TBvIvNq2M1sWr55acIbccpsY5WJInftInw28
X-Gm-Gg: ASbGnctU8OO3A72ez9sAdMNZTExds68Br/ZsMcKjPRmEt83VzyU9HKV2jEkhX0gKowt
	7xu9Iz0sokGGatyElcVMAEs53ljvjztfz0B5M69C09t5IiTxgg3KHFbxe8AgqK7oJkRv4vH7Bc3
	uWuBx5nGE5KlICs6Kpxkh3/rSnzdA44srYoXF+Id9+GP1o96R9gC0RSZjqv/vqFCHYFhGLtM9dd
	U0dEQbk0yFcTFcEIYm1SoJQbzIjBMG2aQvNaE2n0gwQHcvbLntChuuIVOMcLZmxd5qpMTQFKKaU
	QUT63y9IhTf3RRj08iIbaPQSfkFe6gje7u7ZTtrPqis/+eVJ5d4IuLaFE/gfa38Kvz2CdCrDn8G
	W3EQuNXKrkw==
X-Google-Smtp-Source: AGHT+IEkC+tTadCXFScLP1G32ei1mC9Yd5VZfiGai+LcT2Iz3BJBKI8tPw+x/jngazgY6l86z4MM/Q==
X-Received: by 2002:a5d:648f:0:b0:39c:1257:c7a3 with SMTP id ffacd0b85a97d-39d8f50227emr3137236f8f.59.1744302653117;
        Thu, 10 Apr 2025 09:30:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39d893f0a75sm5374033f8f.62.2025.04.10.09.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 0/6] net: dsa: mt7530: modernize MIB handling + fix
Date: Thu, 10 Apr 2025 18:30:08 +0200
Message-ID: <20250410163022.3695-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_093054_855413_E74AFE64 
X-CRM114-Status: UNSURE (   6.64  )
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

This small series modernize MIB handling for MT7530 and also
implement .get_stats64.

It was reported that kernel and Switch MIB desync in scenario where
a packet is forwarded from a port to another. In such case, the
forwarding is offloaded and the kernel is not aware of the
transmitted packet. To handle this, read the counter directly
from Switch registers.

Christian Marangi (6):
  net: dsa: mt7530: generalize read port stats logic
  net: dsa: mt7530: move pkt size and rx err MIB counter to rmon stats
    API
  net: dsa: mt7530: move pause MIB counter to eth_ctrl stats API
  net: dsa: mt7530: move pkt stats and err MIB counter to eth_mac stats
    API
  net: dsa: mt7530: move remaining MIB counter to define
  net: dsa: mt7530: implement .get_stats64

 drivers/net/dsa/mt7530.c | 246 +++++++++++++++++++++++++++++++--------
 drivers/net/dsa/mt7530.h |  42 +++++++
 2 files changed, 239 insertions(+), 49 deletions(-)

-- 
2.48.1


