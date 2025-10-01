Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9EBCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ecfc2ylaD/7+laCYwVlEzsbxMMAjlj+CWU7OhEl57sc=; b=lpCiGJ4XwGWWuwF3hlZ/x8Kg6V
	m0a0flc1JITtc3v/XE/skfce+vmfeqOOF8nBSMLdO/CSK50NO3UTA73E+RCQ8AActs5xWDbKpoHPW
	p3ML5OaVjOgSBElUWgdLKDBSuVha7dhtIedG24oa60xPYiOYXNSxP4sm3jV2Wn6NY6qepO7K/EBLA
	58qi1wDjh/pz0cJL/6zzMlhGlst5UUMrW9oGgSw4hJyn0ITLQje1ut+HzoO5nUKCxKD9Brr4X1HGA
	T7St9Ql/9EUBkd3hYtj0InAzx4HhIMAsCUFaZUscOHzhQvt9AM63IbtnS5OKDi1YLYM5zCy+AKPa+
	O9AzbASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41OI-00000008j9b-1veo;
	Wed, 01 Oct 2025 18:17:26 +0000
Received: from mail-io1-xd62.google.com ([2607:f8b0:4864:20::d62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41OF-00000008j8y-46r2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 18:17:25 +0000
Received: by mail-io1-xd62.google.com with SMTP id ca18e2360f4ac-92790f12293so5975639f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 11:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342642; x=1759947442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecfc2ylaD/7+laCYwVlEzsbxMMAjlj+CWU7OhEl57sc=;
        b=YR2emGNWsohagXhvinHMli0yjQV0uf/b9Z68myWBUvoLLU0Zzrc9dDUIat16BfMN9f
         DtKn2spPb10eKJ6FconMII4SZDmpvV0c0U3RpmsDZ8BSCnebsQBxo4Tz8dtSRPx6RE5H
         MYJvWjIlIL3FOPUIruHZ3cYj1Jyka9vaSI02EvcWv9YHOf/zLgr1VSNVI3YpHOrQFE7O
         SlWUxK8aYAir1iYGFZvosWPPJAFr34D/zelfCSmTaXum/ZUmhVOrxUZtBBTIlPlg3wcC
         zdMiJXxh1nsd0mj2+I0MJ49Fbd1nw4qaeWmG3fh0BfIwbDQ9z6c1KobFPPm5cyj0VRBQ
         R+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXrJxrzKXoFyiPBaN/tPtd0QlJe4giOQin3sgT8nlSjOV8qZPcic8jBNAKXfk9fTq+Imlu35zsW47XoSVRYyPOX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8nCNlfEJG2L3BmPfGi/H3+kG6fxr3v4UtfTP+MREGK4Z8k0E3
	7YHs9JBNxynqwhWJvw/L5NOidpP77sRAI+ZCh09MK6Gjnd3pEr/wcev4VdgWuMXYm445YxrJcXl
	MxOzRKtWjzufNVM0qbgHRKb3jKS680G0ixez2d8P2r/lnDBFI8Yh6mUET/5LeWPK6uJobe0QroY
	XkIBKt+3h98UrhEoZXF8N4rejvdjK+UDFKKde6UzHF57hDE1Cy1nn5CdvFDreJz4DIEbm9fVATO
	I3/0Apu9V7LUEJljhcfYQjq5zY=
X-Gm-Gg: ASbGncuPKGQoqq9C4Pxx2RDm8/i9QAInN1W0ogYFHh/IhNmPvVhmof+i02agVwZ1Yfx
	BfQ8mR7iyMj/kJ9b1nj4wb8QrpBtBPUnn+Eg5acJEpuBch3XVlEv2MnhC6qOL53djDTVRLf8ap0
	KOEz+hhNgZrLVS6YKgKDFDj10MaR9SX8aOkrkE/xJBsXB+bBtsJoRIUQ4KO4mDA7MqG29LyF//d
	XUjL1miOgowYzsZgnRR0bK9b8Ttx8jcvoRrFhyvH3tzyfauShTWHSQZhre/U8dBeOQv8Cn1Uy9O
	ux6Q3pHN+jndseITIwXe6XfbvxoNL59hTuOAHhlNO5Xc0GOD7+dSUkbnlt+ZDspaLbvPyS/LSwb
	KpYHtgRNMkdgSZe7OSzEI7rv8q01cfc99nDToQOj2Yj/U3Y4ASyiIYKEFiHdrxkOLiepTm4S3j+
	d1scjH
X-Google-Smtp-Source: AGHT+IFrj47A/veruvjmP1NZvVxVsYTStR+Wo9Gm3Y2BStcALXL6uTtdjgP/cXalNqIz4wAa8+16zyMhDnjq
X-Received: by 2002:a05:6e02:1a26:b0:424:8749:df47 with SMTP id e9e14a558f8ab-42d81622ca7mr55918635ab.28.1759342642348;
        Wed, 01 Oct 2025 11:17:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-42d8b29b8cesm237745ab.36.2025.10.01.11.17.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 11:17:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-859e412f2c9so25973685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 11:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759342641; x=1759947441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecfc2ylaD/7+laCYwVlEzsbxMMAjlj+CWU7OhEl57sc=;
        b=ZboQ6hVtEBbVXvow7Is8RG/unrdl0QdCHIfdVmnSbSqPfAtUhwnsjPu+2KMSInhilW
         7HbLXMnuHtxPv9KNAdKS+dgFpTBEYZR81r4kA/pdEuGS4sI/4jco56j6cReQ3CGMJ+7G
         PEuUMH+AHb2NQieQ2yoArrMrv/2l02wSW4vmE=
X-Forwarded-Encrypted: i=1; AJvYcCWK5xfwrhUHBKXEFSZyIjjB1ABFtPB3k0dfVPoeXf5s5/inoXSF5yTONyaub9dxJggD8pASdbaE6ZotIHlnGkYT@lists.infradead.org
X-Received: by 2002:a05:620a:3193:b0:866:73f7:259d with SMTP id af79cd13be357-873796bd7eemr589521785a.61.1759342641371;
        Wed, 01 Oct 2025 11:17:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:866:73f7:259d with SMTP id af79cd13be357-873796bd7eemr589514985a.61.1759342640724;
        Wed, 01 Oct 2025 11:17:20 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e78cfsm3847671cf.27.2025.10.01.11.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:17:20 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v2 0/3] Adding brcmstb-hwspinlock support
Date: Wed,  1 Oct 2025 14:16:38 -0400
Message-Id: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_111724_048227_B42F5AE7 
X-CRM114-Status: GOOD (  13.03  )
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

This is a standalone patch for the hardware semaphore feature for
all brcmstb SoCs that have the same hardware semaphore registers
hence platform driver compatible uses:
	  '.compatible = "brcm,brcmstb-hwspinlock"'

The patch has been tested to work as builtin as well as a module.

v2 changes:
Adressed following review comments:
 - fixed ordering of obj brcmstb_hwspinlock.o in Makefile 
 - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
 - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
 - Removed unecessary platfrom_set_drvdata(pdev, bank);

Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.

v1 changes:
based on fixes made to Intial patch :
url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-for-hwspinlock/20250712-034624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250711154221.928164-4-kamal.dasu%40broadcom.com
patch subject: [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed.

Kamal Dasu (3):
  dt-bindings: hwlock:  Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 11 ++-
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1


