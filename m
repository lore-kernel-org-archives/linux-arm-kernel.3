Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54111606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JkXe0O0f;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwT0Jztx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TNcXC8FQ4AQIGuVcbVq3SDd9KqNKYfDqhTIYzFzJ4J8=; b=JkXe0O0fRDNKGI
	pn1fg6X30KrrX3bOmB6nj3S5qYNjPDMVIitL8SSP4dZCIXSmS/5B8OAkV5ZmuiAqEWtXnmj2TQcSA
	GcJ6JLFMXxQyFbOZjYu3TK5cSS6frAwDyXUjK44H60wJ7qgOzwpQUHe0ibiOloflsQ8C0VKaC3SlJ
	R9jd96o+LEVAvV5lgjDQOxnefONBtCQpXvLsaG5xZf5IoAuUBVqXRfEE6b8i62r+hCev0CRXL1Y5e
	0A3bjNtHr74L+A6bUIWYaqOY2Pu9e8CG5zYkQ/xV1CZ94Icq0746UFpo19mtgFfEx4/AlbQN+Vto4
	jx8rEp+XXZfhMPE6IRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Qa-000000014pw-3vRN;
	Tue, 03 Nov 2026 04:47:20 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6QW-000000014nS-3uk3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:47:18 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6363052eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681236; x=1794286036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNcXC8FQ4AQIGuVcbVq3SDd9KqNKYfDqhTIYzFzJ4J8=;
        b=DwT0Jztx+l/vnl32fHpfDormjMz7feFfJx7I58NgLDLai+zFNe5T4RjGdCkEpNAhIg
         Z5b0OXc9WDtq9wjOr8SkgUlOWW1UIb3HtZEBgfngbus9lvlAAP/b2RbM9fvuwmX8gcYC
         fHqqGqPaeygWyO3UQG5Vb6P/6uMdtT5RGtVYbrjtk4imfik6E2kooVhNv+cbVuKImYrI
         MtdeVuy+4wxY/lxOIPihA5fmemSCIkgZUCrqk+h653EesUiDeGVozLaJXRCr88ewW4QU
         UkUb9/4wXqKFdk0I/nWXFCom84xf8U/z5GYJQbKC7DX/43kNV73GWZKL1tntjGvYyeni
         uOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681236; x=1794286036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNcXC8FQ4AQIGuVcbVq3SDd9KqNKYfDqhTIYzFzJ4J8=;
        b=zd0HriZr9Yn5GuCD9Sjs5T1Adaf7H5wmecXMfWhsjAAltH8IuAFYlO9UzZLDv/xmhs
         vCMwdLx+N7PyDFxURabFfR0XmzQJ9EVM0ThUqzR/zX3BZOh4TIFovQ8QqlJVD1orTeIp
         Y8zUeuBimXlpCnn6S0OCkLnvINdhOOYkkS+KB2PexQ7cQsDuKVtWR4DxqEF3Q8R7g5jW
         V9ddvVdadTy3p1SXD38C+y/KnZVwInrCh447w9Naf39O7o4ZGMcqf17Z+YPSVTtA/tv1
         UuubhONb24XabbJoqO4IXQh5owhQBij61vMDqEZz8tAQZHzaS/P0UOaVCzjaK+vf0MNX
         JcjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVc+XkBBHM6+agzDfZzq0MZCYHCvV+qh+qoNygdUtjBZsgeNvVAajceUOztVknSStAp6N2Zu2goFE1OI01niDD@lists.infradead.org
X-Gm-Message-State: APuU4Z+KqEriPJn48AIRkqj4jEvME7mSkWhi7SIE9Fb1t6/heKtPxwaB
	U7Hz5XiWsSPImUjJw/47S6q33YoHFAnAAGug/4sw2VxMXiF48sM0EYue
X-Gm-Gg: AYBFou2OOTMDca5rc6r9LQWNwtDHJq5vuti57EEQdae1j8oUl1j9HdjuwvBXnfD5DxV
	nDUCr9vgI3rkUo5Rbb1y3PVklhdqIC2kbv3EU1vd7dvp0AvYf6rplVsW2fnqqL6iIYWOIHN3f+1
	/rFbhagryY6D7PjxGhzBwxT5o096RYh6dF3SOv0l60a7/wjkXrZcobn7ebcuBv+rZ7x7ISxlS+M
	xyV0JNCi1t1lzcb77//4q1C6wUEkkfMWZVuAeS0dRzpioIzYvAB4oYUuRQJoWnRPNLa2//uk1/d
	hfozOvqWiLYS/AZ1ZqOvziXahfgOTUDHFR07zwSr4OoPgQHsLMuK/8cQRf/e2xMgMJB21QQ6ExN
	5sJRLnqhgELDGCVB7oLvFe8UsknbnohYFbk8gd2lFzxjQ+osBnK2OgQHP/3V3UoHPsgMpz2cbri
	tI+nREXmeESHyf/c6VFfOb4p8CFlU7cjiDQY4ZGERzqr/KsNZ7pa32nIg6Pz1u+mKTXgPdr3W5h
	jWMPOdcYh/4zI3XeV5+j0UqsvSw91+Ap5QsbRWoe033ZItTT60rVSoQkmuCr0r3PYthDL0o6Vww
	yURMQn4HFaIC/AAe5fbV3dZvonAKE5hgge9DhV5297V/ugq9l8wgv3QmAXp7PDJ7v8fHwJ6RVTa
	dPDWOrEKnY1MaK8P0qQ==
X-Received: by 2002:a05:693c:4154:10b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a424988abmr21088734eec.41.1793681236195;
        Mon, 02 Nov 2026 20:47:16 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:15 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] Input: wacom_w9000 - rely on touchscreen_parse_properties() for resolution
Date: Mon,  2 Nov 2026 20:47:05 -0800
Message-ID: <20261103044708.2461481-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204716_976197_3347378C 
X-CRM114-Status: GOOD (  10.56  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The input core's touchscreen_parse_properties() helper now parses the
touchscreen-x-mm and touchscreen-y-mm properties and calculates axis
resolution in units per millimeter automatically, including handling
axis swapping.

Rely on touchscreen_parse_properties() to configure axis resolutions and
remove the manual property parsing and resolution assignment block in
wacom_w9000_probe(), along with the now-unused local variable.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/wacom_w9000.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_w9000.c b/drivers/input/touchscreen/wacom_w9000.c
index 4a2629a54167..51c5301262d3 100644
--- a/drivers/input/touchscreen/wacom_w9000.c
+++ b/drivers/input/touchscreen/wacom_w9000.c
@@ -249,7 +249,6 @@ static int wacom_w9000_probe(struct i2c_client *client)
 	struct wacom_w9000_data *wacom_data;
 	struct input_dev *input_dev;
 	int error;
-	u32 val;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(dev, "i2c_check_functionality error\n");
@@ -350,15 +349,6 @@ static int wacom_w9000_probe(struct i2c_client *client)
 	dev_info(dev, "%s size X%uY%u\n", wacom_data->variant->name,
 		 wacom_data->prop.max_x, wacom_data->prop.max_y);
 
-	error = device_property_read_u32(dev, "touchscreen-x-mm", &val);
-	if (!error && val)
-		input_abs_set_res(input_dev, wacom_data->prop.swap_x_y ? ABS_Y : ABS_X,
-				  wacom_data->prop.max_x / val);
-	error = device_property_read_u32(dev, "touchscreen-y-mm", &val);
-	if (!error && val)
-		input_abs_set_res(input_dev, wacom_data->prop.swap_x_y ? ABS_X : ABS_Y,
-				  wacom_data->prop.max_y / val);
-
 	error = input_register_device(wacom_data->input_dev);
 	if (error)
 		return dev_err_probe(dev, error, "Failed to register input device\n");
-- 
2.56.0.385.gac671c819a-goog


