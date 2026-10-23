Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2853606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bkcGm3Q0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfPHrcTZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WapLi7sY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Q9T5DRA+uqKDqTbkysqot+G2nwnmqz/LaQ5soZeW3wY=; b=bkcGm3Q028OLEUh8HGDvPdOS5C
	kZf+nDL1HA9e0+0hiOWXBlgIkbkKJCixDx0z9VP/TVBhCnqUiGSrQ0+TqhQg+U6NUn89TkQe4jETX
	+Pj/HUe5DHfQvziuiHxrzr/dcNQAnRq2CEBjAHvI012fb3ittlk94sNI8JOacujPxEUVZIV86cviD
	y8wnOhTthI50eW0Bhcso2AerOuCOUUgqeZ4wCbYc7QBPMa67prANSWbZ6yTvfxjtqBarXHeNi9C2Y
	fJ6coqCAARYL1ftulK7zoU0DPnlLoCF/lCB0nJmfw09y0CWYSzci+7ubUImk9eqVnBtolk+SPMLsU
	gVXSmi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMH-0000000Ft5u-27Nd;
	Fri, 23 Oct 2026 08:10:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMF-0000000Ft4i-116u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:10:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FUcp2650417
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q9T5DRA+uqKDqTbkysqot+
	G2nwnmqz/LaQ5soZeW3wY=; b=lfPHrcTZPHwciuX5vPf4BM7XSbx201qyWTBi2d
	z4jrdP4O0O7Ntljn+qE8jlcT/vQBLD/EHCRFGit4tuXVURK7xpV6v/Kq+4fAnAJ1
	Ar9Gu7h7tdhSMbxibwJmNDqtqDcBUJmVFv7pEdOfH+Rcy10dmUi1+QHKNeeSYSB5
	Og3j5vVXfGms9RhUje8+7aO6Q/5GLUghS3PupICCmHgOxfr7XOntrK1kRpWUd5FP
	QsN3uCPYa9oDueb6CoPEkCO0DGycdggUIjKo9qOvh1pU0+h9QEpazr53T8dRLROC
	k9U9M+UnbIEr1MHBXjttMi4DQsuYPaxvyQzlj+8FKoPi15jQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjapjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a3c27c9bso12414216d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743033; x=1793347833; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q9T5DRA+uqKDqTbkysqot+G2nwnmqz/LaQ5soZeW3wY=;
        b=WapLi7sYWbTT19s9YS8xuo1oVpE/w92JYKomwBo+nQlJSh5/wXP0WdHZ0WI4jRTOJQ
         3rece8s8+tjcvJdwKPXzUsL2ule2DGMZ2Z0eGaUTp3HPw626jdkN2BFNn/l8J4ucJrrW
         hPWrAtu2Zy3v/F34XqQqQzo557PhM3YlcUSC0RAHwlkfW0t+JhtU/oSnqEk7tn/3rvCC
         1XC3tMqXfJRm7xBGajK/5ZMQgPotrdG5OqZx8lXBJHZUR9Slv0GuYiiX9znPW+cOHELf
         ndObCBHoegI9F21dgJ2+codBlRI+42yxa97DjzVUhUV6foykvDuHyX0tR9h4uVnVpla6
         fWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743033; x=1793347833;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q9T5DRA+uqKDqTbkysqot+G2nwnmqz/LaQ5soZeW3wY=;
        b=m/faMDj6+lxStX8GUH7y538Y2rNotd5ltQEOS+z0bgeUiph7cYZRXneyxqejBaBMt7
         D7VLaJTYxcuxQsifTsdBGDoXj9zZa+uqIZTFDx7KV67nl4LbCqKux8KONXCN6eJTc09E
         7zmdvVur45gpjPKpNZaQvMFLz38+4RAw+FF6T3M9KhIWAiQl4rwXaqHfZKfkdPFIAtSg
         I84RpTkziKF2tgDOciyfwq5ui47j5qI42LpSRuT7b2kp0Lc5Y1QYH5/0oxWMwU4+apks
         l01kiiv/Rio0ZVYdZLaJgGbNzVqbct1Tz+ZVvFLLyuXffotIMlY4kmUTZuOgN0nf4ZbH
         699g==
X-Forwarded-Encrypted: i=1; AKwUvBwIH6xYRfK1pMIeuLbFjeoqUCd4b+KUEtAHRj05TkDXGeXawmkJRhotKrXqnuA7AexaT2Ii7zK4RUEUdVoPY0d3@lists.infradead.org
X-Gm-Message-State: AFq9FYIwCDLv3HSXxle3K47bJ1PDKDvScSZuW4rOo4JXVQxE/5akYoTK
	By6POHzFfh5/+dm8HKYWjN8X+scGUkUbgnFMhThMWjadRaqkiIUoIFRHwap6NovNA0OrqDPeYYK
	7QGmlhMdc16qXeOEO/nTq+z7dknVfwMHW5OH9S/wLM3oxQaGeeTbICv1JVj4TeWh8AdOFeRgDks
	r1kQ==
X-Gm-Gg: AYBFou2XyKBTlS8UuBMtzB4oWoCN4IKEiYF5t/GwnwmL/ijobLf5c8atb665s2dPluD
	0JFub/Qus5qPVOa8eFSfdzVV3gzfwp94BKdYrC/PWsLY9MLLChTJpG1YCYu+K12pbqEqoSMI0EJ
	k/UVB7CcLb742Dj7NJNuznGNC8njniZ1N6z/uU98B3W4NecT6FynT66s+JUolw9RFR+bu0MSYjh
	0KZj6XhIqU/RaZRTJ36XLUmsl3YeROUUy4tiSqR6gb5n5RMQ5WqGZAqEOmeubH/Afq6K9cNllk3
	Q7cjqkq+6QFwkUIuykwS1xj/zMzjo1Q2I9OHsrvb0CjE2+Yk7VktdcZgw+MM2FawqGC23132ACb
	y0NHd0W2ifDg=
X-Received: by 2002:a05:620a:3188:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93f6f80685fmr302988285a.64.1792743032634;
        Fri, 23 Oct 2026 01:10:32 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93f6f80685fmr302985685a.64.1792743032087;
        Fri, 23 Oct 2026 01:10:32 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2153c1b7csm18523725e9.1.2026.10.23.01.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:10:31 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net 0/6] net: stmmac: XDP path fixes
Date: Fri, 23 Oct 2026 10:09:52 +0200
Message-Id: <20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LMQqAMAxA0atIZgNtRUWvIg7BpprBKo2IIL27x
 fHx+S8oJ2GFsXoh8S0qRyywdQXLRnFlFF8MzrjOGtegXvtOCz7+xCAPKxpD5FrfDxQslO1M/Id
 yTRD5gjnnD+NFBfxnAAAA
X-Change-ID: 20261023-stmmac-xdp-fixes-00aa25d79af1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: CZ5C-aa0N9143-MyRBT4ejn5jOUAilyU
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb1679 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mZfc6SlRgOl0Hnr-beQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX41Af0cbaWSlH
 BnpyG7SbqtdGGBsY8e948beypocPRy4P37oNwLtYR/7fydqs+JxgPfSDZQEPqcO4lfqfBU9JDzC
 IRoRxTpu5yCDhsWX/GwZLlLdCUos0y8=
X-Proofpoint-ORIG-GUID: CZ5C-aa0N9143-MyRBT4ejn5jOUAilyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX+GZJGFImSei+
 elj1OpTQ55DAWFKihwUQTtJZnjDju4aJ5fcdFIQ9vOkjTL5eKEagG6T/O3JN/1PUMhtXFQxdYZU
 jjXiaqDwL5Sc4owxX5kIpFdIlHLMCIsTb8aXSC4xpO5lXMiwiDfe5eM6QEN34y4k2gfA7Bvc2wR
 6AhIGFH4Hapy2kt2MHOiMiAzAQzJczY3qLEyQh6kPs3wDzQZSUzSBNhB3l+Cib3p401mDWhmQXP
 76LWoQsGT1e+CeiWyJw305kV6IG6pReY0ANqXUA/jwtdCjbU3z5ofMZrhCWpp2Tsx2BdBB9rnhF
 bou+0IUxJOrZdObKdKekRueQGIF6QiIT1u/M9dKDrUMXnEOim4YRWrPMSnFhbKah7ICElVQKqYC
 hBRiwktIJtc98toZhO+PD8x4qHoZ1qq3WpYMAFcHe8oD/XsgSHbDvoAIdVxd9w9xeGn6i6RVRA+
 aQbaeGcc83Z1hqkJiDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011035_406465_17B920FC 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds some stmmac XDP preliminary fixes needed to introduce XDP
RX multi-buff support.

---
James Hilliard (1):
      net: stmmac: take ownership of saved RX state at poll entry

Lorenzo Bianconi (5):
      net: stmmac: drop split frames on AF_XDP zero-copy RX
      net: stmmac: drop multi-buffer frames in XDP mode
      net: stmmac: copy XDP metadata in AF_XDP zero-copy RX
      net: stmmac: fix VLAN tag stripping on short and non-linear RX frames
      net: stmmac: fix XDP RX buffer DMA sync length

 drivers/net/ethernet/stmicro/stmmac/enh_desc.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c   |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 183 +++++++++++++---------
 3 files changed, 112 insertions(+), 75 deletions(-)
---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261023-stmmac-xdp-fixes-00aa25d79af1

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


