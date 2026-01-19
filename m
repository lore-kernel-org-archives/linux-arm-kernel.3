Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317BFCCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vUfXZM6AiYyNqMON5WUuZGEUwe4BPoqrVV35Lqaruik=; b=XDJ+0WaJNObRT9
	uBJyLwf6FOAeN5aWZ++TW+L/6X1/ZMOZYzcqubtXePOcS2VI1V0yzWUO/OJNv4cSPBQF/EixjkCbo
	1GRki5ZiP/z3UFcszGgT6LcxD2gvQ6EkEU7DhT8Nci5Vp/DpcQTtMByFxjHghZTb+ijg3KHX8vpou
	2ft1Mq5Orx87W0w5THHWxRQC3kB6LzEfoaGmbMXHfu08JtRYPg88+uBkipinR+MzXo114/K3iDB1W
	IzmXyxToznk0VC4MSJUUgkxDi/YO7PhNlFBhmIk9DEUVsQuklAFo9zXsGflVCqWdkHI6hfOyAv8uZ
	rGa3Ga49cOPLpY0TMsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgg-00000001mtI-3JQX;
	Mon, 19 Jan 2026 10:40:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmga-00000001mpd-2Sq3
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 10:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=vUfXZM6AiYyNqMON5WUuZGEUwe4BPoqrVV35Lqaruik=; b=nsSXANH2YTqXDTWRABiZH9gIxx
	8LUSC5MMdbjlD2JsAAYdj3PpYPTqaArQQsbi63SGFl1KqvAYhRFcCROY3GMQcGflh4YJbQcLGnSpR
	9Lzm7jzEF5QxVNQtxp1hMkInKq+9R+dNkJvKHFNfPWiUFPpXpW95QDNz9YE28+9W7Rdd9XFlaprwm
	QfzaZQqS0BiDfeGmAUriA3am9ixieFo9ObQCEWRD35dqqfj+OvRO6Elw8N87ZRX3ukt3170QXAKg1
	qXizkjJ1QdoNb1+lL7DxGj61rcU48gB45J9/tCQZXAMveERnKvR+Ac0aZw4BFXOBMz9OnhEROWpgP
	q8OiuD6w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgX-0000000BsbD-1It4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:40:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JAJp3n1531330
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vUfXZM6AiYyNqMON5WUuZG
	EUwe4BPoqrVV35Lqaruik=; b=ex9yCai2MfTnTplGDoXVqEhON42NGGCsaM4L6G
	mCHZ18c0KyV+mODSNZn3WmtdGsTLrOfmUaCU+NhXkG7X1eTSsNf/TtTdzYdEjXzQ
	Cdzz4Zj0SptSY2ZeLLvvTxc76yzXYdqBmCi+5asKx3kclqx6TGxGzS59kfbnW2hT
	zGclV3ubYq8Vfn0iUoHoo9/Aoib2Qdj3OkhhnTnNcQWJm8n50RlkgfF8j2RkzyXz
	JGmgFsxdzjAHtSWfm9F5ZGM4mqfnyCYsTlGhd4tndPplrWftLo57Id9ELbuExTb7
	hg4GLa8wt0+COOuq/QSmuwmwOiiV2xwPEDe7eQx7zF/ZW5YQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxr1yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c53919fbfcso1029920485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819232; x=1769424032; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vUfXZM6AiYyNqMON5WUuZGEUwe4BPoqrVV35Lqaruik=;
        b=ZKOQiR1QYw4EGJRTi+USBf5Dj7RRRvt0mEfH1rCdqAXlth7DIu7why3QmwSrb99haM
         Fe7g//M2IJNIezlXjgJNfhXfeRKdkbvBWfmWY3AK9dxKeqCFfvAmsBkPMI4tCZcAlpjA
         dHYexPo4gnkNO9c1Vqg/LQc6GydhcoUmmxzGcA/ArVK0R17tS2gQfaV5sI1OtjAhqtv3
         WCXpUNIUVAzXiL5a/5N7Mg/n3jU4DhVOQpb7VRFZtVjfoMuEKEsuN2mwmtGYn4NdpOnp
         5tXFTmrPhuI/ZHHmWw8n4Sg6brVeEk6v1A0HAhcuC9E7GgzZJijLsR/0cMcnnCMv+2ek
         FqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819232; x=1769424032;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUfXZM6AiYyNqMON5WUuZGEUwe4BPoqrVV35Lqaruik=;
        b=S1DXXqJ11u+G6uTlklg34F1i/0SlugYRnImMitfDbDPZ2elKLe/Fsst+D0CPDlvL99
         Kav0VQGoIgurqrPtBCMm2ah2xG2an0/Mmmf14xCJ8/QauhRByhmXE2wPT2V2jeP8SFQ3
         x6x6TImyq4nu390DD5O+VbA0sG9i7hGOO4BKvHVJgrgAxQeQpY8yk4J+NTYPA1Hy44U5
         i+qsfnPNxsarSgYY0rekQL1FZKzZDHidmP8I6qlAwj+hEd7a6wwOw+L7rMPwAtn2OBnd
         wsnDIr6RdhK5g71AGPGacoP0Ej05WoqDIDZDYJe2sEeATS5X+Ch20KA8N+k1YEUPAUbh
         kCEw==
X-Forwarded-Encrypted: i=1; AJvYcCWIPqG+tivRKapShSZ0uMMSZ9bD+ZtUHYkpbeCcXvwLWKLnnifSAdtUc/oU8jL/uwIhc06pT9IrrIKoWUxN/orR@lists.infradead.org
X-Gm-Message-State: AOJu0YyTzC8gQSRpE3xNf3o0YnrZDV+M6Wjv13Ba6SsUyRj0NjHxL87T
	f/cFJj6NCS5w2OUYLT9ABlSlu7BtHWxRDByWyaPiBCgpBhajB8QLR0b4YbwUu7+Sz49moHLclZx
	rJwCtdjp91lHvPWQKTzT+jSyAfrsY31Zh/G6r2HFm0Zb8or6q4OxZlJjuCte47wZsycd6PW9zJ2
	n73w==
X-Gm-Gg: AY/fxX5gUlUpcalxd3t4fwkTLIibX2Nh2C0PPKCrXqGvyPcGlZc9eVCpcjC/ivxfFYD
	kfG9ZqthXdI8pgrq29SMm8YA1F29LSCcNeaZMYaI7RLpJK4ujlIfQgEac3CqRvujMz2gh2/sQgu
	6CrYUUlfpjn0MBzu0UdJmgdMef2ySxO9ysMSzsfj6irtg08Yu7EfqYllTcLEq8JEZ5vE08+kYnu
	h++pfOGn6scUokS62xErFRGfQrOL3Nh+zuOpjHtXuhD1KjdmSDg2I8JA8pn0LHFG07zJOWFl+N8
	BDGxY1vxRr248ejkrWedjv4Q55u+DXDagaY0pMFxKN/VkOC+wczSyPoRN7olgmBYXuNJkhtVO9l
	GCIJP2itpONxTmT0ClXAcItMD/ue5dgAzdWHxyoRw
X-Received: by 2002:a05:620a:700d:b0:8c0:88f3:fac4 with SMTP id af79cd13be357-8c6a675aca6mr1531013585a.56.1768819231903;
        Mon, 19 Jan 2026 02:40:31 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8c0:88f3:fac4 with SMTP id af79cd13be357-8c6a675aca6mr1531010485a.56.1768819231355;
        Mon, 19 Jan 2026 02:40:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/8] soc: remove direct accesses to of_root from
 drivers/soc/
Date: Mon, 19 Jan 2026 11:40:11 +0100
Message-Id: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAsKbmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0NL3eL8ZN38NN2i/PwSXXPzZAuzZFMTA0ODNCWgjoKi1LTMCrBp0bG
 1tQCEhjJgXQAAAA==
X-Change-ID: 20260119-soc-of-root-77c86c54010f
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iSlD7Dh/mbSNiQJOq0DMMW6/96hXXaA8D+ljD2AYSQQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoPyu5DMHSDKBFDw0X0fP2m0FmfzN/Sdyy3W
 dqzR8wP3oeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KDwAKCRAFnS7L/zaE
 w3nQD/0YIZZ70BVx/YX83RjrD4BVPwudBPlg1Tus56sNutGPvS6lJZKSCW4P0t4BaiGMZYu0uXx
 DwSJRVUSD1zKm4YMyapEElVBmfRU9coZHgJpytVECZ3rhW0J6UyQtwHt1NdxBjnnGtvLekAiCUi
 vXpZ7P4xjn8TGkDrrO1PZRCSsxtwNMqQO3EJchlBxdPTBpZTGRvAKkoqYunwCejG6n1270zn98f
 X7MuSTcMvRTNqCwDzrzE3XOyPd35CWzMzMc//cChVADri226wL5wnjLkcmzaHJl+475efNQP25e
 LgL+OK2N6W0HujWTQQ7wUX68ImeORNrNcitC/JR4yg5498se0k9EYa5fSzVG4vDL771xG+QgNTm
 EqRyPPYj5Lv9aKzRsk6qf3tq5lpJGg7len19ubZ0SCzH10IsH6KOPF0LOAUihIR8A5vHVMGa5Sk
 crm/fM9EtP+WfFiTbkIUnkno84RmJ/p+BkIG90rRr2+vHGY1fIDfzcxsSgrtLhfOijOCC40nSla
 Ow7zYwTN3NNbOY/Hr0nqgcIRGp0UX0vW+EAv5ci1cDzFvWJ6PqqONuFE6xGalVaCwYN1zW9qh3w
 b9SP7pAjgLY6XTwQNhpp+q6LC+rE352LHeeE5ZPYuj39akWt1a4R+s43+NJH+aC2ifjqziQF+jx
 yElJMXxuP6CE8iA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NiBTYWx0ZWRfXwJVgdfN2f49R
 O2KR8cnJxMzOElNkQi4K+VJbdURmNNePWW3D8cXl6wIK7XxapDNWnOLSP0TbzA8EtNFLrANSNC4
 rD6LgUBBizQ0+uivRQ+1ZtI/XrULAeKHI9fro34BoY/5W/GUnFf5n40H+155eJFf3YyzZv4ZT4k
 Un48SIfOHIxhXpmjj49ZpvJg5cQeNajBBLWAeNr82Z26YPy0VzhlvLsdoJKcIAs8DwzZKNtOQnW
 Umx4fDGZgE4rkFjZbwMFOs2bd8Cj9REfQaaELq4CtKGynHXNNoK0KA7gT2E2ARk/Ur+9tmsqrC5
 Oxz2n6umx5Weg+CVzO8ykAPWjochfhcUnEY90Jhed/nmY54vIwPh+VkjgE3UwIPOlfo69M83c/R
 R2GJLqROwTQRZhqg1Rf7oczoWUTX1LbJ6LrfML8bVbBy2R3XXPr1JIl1b1RTWrqGc9NVhcNKUH8
 i4xIEpOXUbyrful+0vw==
X-Proofpoint-GUID: Y1rrbztf3nt6-9wAgG4xN5DxJcNQrC4O
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e0a20 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IK8FBO9Hk_FkL9rbzwgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Y1rrbztf3nt6-9wAgG4xN5DxJcNQrC4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_104037_804951_88629ABA 
X-CRM114-Status: GOOD (  14.93  )
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

linux/of.h declares a set of variables providing addresses of certain
key OF nodes. The pointers being variables can't profit from stubs
provided for when CONFIG_OF is disabled which means that drivers
accessing these variables can't profit from CONFIG_COMPILE_TEST=y
coverage.

There are drivers under drivers/soc/ that access the of_root node. This
series introduces a new OF helper for reading the machine compatible
string, exports an existing SoC helper that reads the machine string
from the root node and finally replaces all direct accesses to of_root
with new or already existing helper functions.

Merging strategy: other than patch 1, everything else can go via the SoC
tree. I suggest Rob taking patch 1 for v7.0 through the OF tree and the
rest can be picked up after v7.0-rc1 is tagged.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (8):
      of: provide of_machine_get_compatible()
      base: soc: order includes alphabetically
      base: soc: export soc_device_get_machine()
      soc: fsl: guts: don't access of_root directly
      soc: imx8m: don't access of_root directly
      soc: imx9: don't access of_root directly
      soc: renesas: don't access of_root directly
      soc: sunxi: mbus: don't access of_root directly

 drivers/base/soc.c                | 26 ++++++++++++++------------
 drivers/of/base.c                 | 13 +++++++++++++
 drivers/soc/fsl/guts.c            | 12 +++---------
 drivers/soc/imx/soc-imx8m.c       | 11 +++--------
 drivers/soc/imx/soc-imx9.c        |  4 ++--
 drivers/soc/renesas/renesas-soc.c |  7 ++++++-
 drivers/soc/sunxi/sunxi_mbus.c    |  2 +-
 include/linux/of.h                |  2 ++
 include/linux/sys_soc.h           | 10 ++++++++++
 9 files changed, 54 insertions(+), 33 deletions(-)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260119-soc-of-root-77c86c54010f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


